#!/usr/bin/env python3
import os
import re
import json
import argparse
from collections import defaultdict

# --------- Patterns to detect different CDN/github patterns ----------
# jsDelivr gh pattern (with or without @branch)
PD_JSDELIVR = re.compile(
    r'https?://(?:cdn\.jsdelivr\.net|cdn.jsdelivr.net)/gh/([^/]+)/([^/@/]+)(?:@([^/]+))?/([^"\)\s\']*)',
    re.IGNORECASE
)
# rawcdn.githack pattern: rawcdn.githack.com/user/repo/commit/...
PD_GITHACK = re.compile(
    r'https?://rawcdn\.githack\.com/([^/]+)/([^/]+)/([^/]+)/([^"\)\s\']*)',
    re.IGNORECASE
)
# raw.githubusercontent / raw.githubusercontent.com/user/repo/branch/... (rare but useful)
PD_RAW_GH = re.compile(
    r'https?://raw\.githubusercontent\.com/([^/]+)/([^/]+)/([^/]+)/([^"\)\s\']*)',
    re.IGNORECASE
)
# github pages direct links or github.com/user/repo/blob/... -> can be used to infer
PD_GITHUB_BLOB = re.compile(
    r'https?://(?:raw\.)?github(?:usercontent)?\.com/([^/]+)/([^/]+)/([^/]+)/([^"\)\s\']*)',
    re.IGNORECASE
)
# Generic github.com/user/repo@branch or github.com/user/repo patterns (less common in these files)
PD_GITHUB_GENERIC = re.compile(
    r'https?://github\.com/([^/]+)/([^/]+)(?:/(?:tree|blob)/([^/]+))?',
    re.IGNORECASE
)
# base href pattern simple (catch anything in base tag)
PD_BASE = re.compile(r'<base\s+href=["\']([^"\']+)["\']', re.IGNORECASE)

# patterns to extract ID from page
PD_TITLE_GAME_ID = re.compile(r'Game\s+(\d+)', re.IGNORECASE)
PD_CANONICAL_ID = re.compile(r'<link[^>]+rel=["\']canonical["\'][^>]+href=["\'][^"\']*/(\d+)/?["\']', re.IGNORECASE)
PD_META_ID = re.compile(r'content=["\'][^"\']*/(\d+)/?["\']', re.IGNORECASE)

# -----------------------------------------------------------------------------
def find_matches_in_text(text):
    """Return list of normalized source tuples found in text:
       (provider, user, repo, branch_or_commit, path)
       provider will be 'jsdelivr', 'githack', 'raw'
    """
    matches = []

    for m in PD_JSDELIVR.finditer(text):
        user, repo, branch, path = m.groups()
        branch = branch or "main"
        matches.append(("jsdelivr", user, repo, branch, path))

    for m in PD_GITHACK.finditer(text):
        user, repo, commit, path = m.groups()
        matches.append(("githack", user, repo, commit, path))

    for m in PD_RAW_GH.finditer(text):
        user, repo, branch, path = m.groups()
        matches.append(("raw", user, repo, branch, path))

    for m in PD_GITHUB_BLOB.finditer(text):
        user, repo, branch, path = m.groups()
        matches.append(("github-raw", user, repo, branch, path))

    for m in PD_GITHUB_GENERIC.finditer(text):
        user, repo, branch = m.groups()
        branch = branch or "main"
        matches.append(("github", user, repo, branch, ""))

    # If a <base href> exists but didn't match above, still capture it
    base = PD_BASE.search(text)
    if base:
        url = base.group(1)
        # attempt to match it again with the more specific regexes
        if PD_JSDELIVR.search(url) or PD_GITHACK.search(url) or PD_RAW_GH.search(url):
            # already captured above by one of the patterns
            pass
        else:
            matches.append(("base-other", url, "", "", ""))

    return matches

def extract_game_id(text, filename):
    """Try a few heuristics to find an ID and return it (int) or None"""
    # 1) canonical link
    m = PD_CANONICAL_ID.search(text)
    if m:
        try:
            return int(m.group(1))
        except:
            pass

    # 2) title like 'Game 24949'
    m = PD_TITLE_GAME_ID.search(text)
    if m:
        try:
            return int(m.group(1))
        except:
            pass

    # 3) look for occurrences of /digits/ in comments or meta
    m = re.search(r'/(?:game|id|/)(\d{3,6})/', text)
    if m:
        try:
            return int(m.group(1))
        except:
            pass

    # 4) filename numeric (e.g., 35.html)
    m = re.search(r'(\d+)\.html$', filename)
    if m:
        try:
            return int(m.group(1))
        except:
            pass

    return None

def main(html_dir, zones_file, out_txt, out_json):
    # load zones.json if present
    zones = []
    zone_by_id = {}
    zone_by_file = {}
    if os.path.exists(zones_file):
        try:
            with open(zones_file, 'r', encoding='utf-8') as f:
                zones = json.load(f)
            for z in zones:
                zid = z.get("id")
                url = z.get("url","")
                name = z.get("name","")
                # try to map by filename at end of url
                m = re.search(r'/([\w\-\_\.]+\.html)$', url)
                if m:
                    zone_by_file[m.group(1)] = (zid, name)
                zone_by_id[zid] = name
        except Exception as e:
            print("Warning: could not load zones.json:", e)

    results = []
    sources = defaultdict(list)   # source_key -> list of (file, id, name)
    files_scanned = 0

    for root, _, files in os.walk(html_dir):
        for fn in files:
            if not fn.lower().endswith('.html'):
                continue
            files_scanned += 1
            fp = os.path.join(root, fn)
            try:
                with open(fp, 'r', encoding='utf-8', errors='ignore') as f:
                    content = f.read()
            except Exception as e:
                results.append(f"{fn}: ERROR reading file: {e}")
                continue

            matches = find_matches_in_text(content)
            gid = extract_game_id(content, fn)
            mapped_name = zone_by_id.get(gid) if gid is not None else None
            # if filename maps to zones.json, prefer that name
            if fn in zone_by_file:
                mapped_id, mapped_name2 = zone_by_file[fn]
                mapped_name = mapped_name2
                gid = mapped_id

            if not matches:
                results.append(f"[{gid if gid is not None else '?'}] {mapped_name or fn} — (no source matches)")
                continue

            # deduplicate normalized source keys per file
            seen_keys = set()
            for match in matches:
                provider = match[0]
                if provider in ('jsdelivr','githack','raw','github-raw','github'):
                    _, user, repo, branch_or_commit, path = match
                    # normalize a key like github.com/user/repo@branch
                    key = f"github.com/{user}/{repo}@{branch_or_commit}"
                    if key in seen_keys:
                        continue
                    seen_keys.add(key)
                    results.append(f"[{gid if gid is not None else '?'}] {mapped_name or fn} — {key} | path={path}")
                    sources[key].append({"file": fn, "id": gid, "name": mapped_name or fn, "path": path})
                else:
                    # base-other or unknown
                    url = match[1]
                    key = f"other:{url}"
                    if key in seen_keys:
                        continue
                    seen_keys.add(key)
                    results.append(f"[{gid if gid is not None else '?'}] {mapped_name or fn} — {key}")
                    sources[key].append({"file": fn, "id": gid, "name": mapped_name or fn, "path": ""})

    # write TXT output
    with open(out_txt, 'w', encoding='utf-8') as out:
        out.write("=== Detailed per-file scan ===\n\n")
        out.write("\n".join(results))
        out.write("\n\n=== Source summary ===\n\n")
        for src, games in sorted(sources.items(), key=lambda x: -len(x[1])):
            out.write(f"{src} — {len(games)} files/games\n")
            # group by id if present
            grouped = defaultdict(list)
            for g in games:
                grouped[g.get('id')].append(g)
            for gid, items in grouped.items():
                for it in items:
                    out.write(f"  - [{gid if gid is not None else '?'}] {it.get('name')} (file: {it.get('file')})\n")
            out.write("\n")

    # write JSON output
    out_data = {
        "scanned_files": files_scanned,
        "sources": sources
    }
    # convert defaultdict lists to plain lists for json
    out_data['sources'] = {k: v for k, v in sources.items()}
    with open(out_json, 'w', encoding='utf-8') as j:
        json.dump(out_data, j, indent=2, ensure_ascii=False)

    print(f"✅ Scanned {files_scanned} HTML files.")
    print(f"✅ Found {len(sources)} unique source keys.")
    print(f"📄 TXT report -> {out_txt}")
    print(f"📄 JSON report -> {out_json}")

if __name__ == '__main__':
    p = argparse.ArgumentParser(description="Scan html files for github/jsdelivr/githack sources and map to zones.json")
    p.add_argument('--html-dir', default='.', help='Directory containing HTML files (default current dir)')
    p.add_argument('--zones', default='zones.json', help='Path to zones.json (used to map ids->names)')
    p.add_argument('--out-txt', default='gamesources.txt', help='Output text file')
    p.add_argument('--out-json', default='gamesources.json', help='Output json file')
    args = p.parse_args()
    main(args.html_dir, args.zones, args.out_txt, args.out_json)
