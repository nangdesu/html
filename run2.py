#!/usr/bin/env python3
"""
clone_and_localize_realtime.py

- Scans HTML files for github/jsdelivr/githack/rawcdn references
- Clones unique repos into assets/<user>_<repo>/
- Streams git clone progress (best-effort parsing of git stderr)
- Tries to checkout commit hashes when provided
- Rewrites HTML files to point to local ./assets/... equivalents (base, scripts, links, imgs, css url(), fetch)
- Backups original HTMLs as .bak
- Produces gamesources_local.txt, .json and .csv
- Use --dry-run to test without cloning

Usage:
    python3 clone_and_localize_realtime.py [--html-dir .] [--assets-dir assets] [--zones zones.json] [--dry-run] [--force]
"""
import os
import re
import sys
import json
import csv
import time
import argparse
import shutil
import subprocess
from collections import defaultdict
from math import floor

# ---------------- Patterns ----------------
PD_JSDELIVR = re.compile(
    r'https?://(?:cdn\.jsdelivr\.net|cdn.jsdelivr.net)/gh/([^/]+)/([^/@/]+)(?:@([^/]+))?/([^"\)\s\']*)',
    re.IGNORECASE
)
PD_GITHACK = re.compile(
    r'https?://rawcdn\.githack\.com/([^/]+)/([^/]+)/([^/]+)/([^"\)\s\']*)',
    re.IGNORECASE
)
PD_RAW_GH = re.compile(
    r'https?://raw\.githubusercontent\.com/([^/]+)/([^/]+)/([^/]+)/([^"\)\s\']*)',
    re.IGNORECASE
)
PD_GITHUB_GENERIC = re.compile(
    r'https?://github\.com/([^/]+)/([^/]+)(?:/(?:tree|blob)/([^/]+))?',
    re.IGNORECASE
)
PD_BASE = re.compile(r'<base\s+href=["\']([^"\']+)["\']', re.IGNORECASE)

# find urls in common attributes or inline JS (simple heuristic)
PD_URL_GENERIC = re.compile(
    r'(?:src|href|data-src|data-href|poster|data-url)\s*=\s*["\']([^"\']+)["\']|url\(\s*["\']?([^"\')]+)["\']?\)|fetch\(\s*["\']([^"\']+)["\']\s*\)',
    re.IGNORECASE
)

# title/canonical id detection
PD_TITLE_GAME_ID = re.compile(r'Game\s+(\d+)', re.IGNORECASE)
PD_CANONICAL_ID = re.compile(r'<link[^>]+rel=["\']canonical["\'][^>]+href=["\'][^"\']*/(\d+)/?["\']', re.IGNORECASE)

# git progress parsing patterns (best-effort)
RE_GIT_RECEIVING = re.compile(r'Receiving objects:\s+(\d+)%\s+\((\d+)/(\d+)\),\s+([\d.,]+)\s+([kKmMgG][iI]?[bB])')
RE_GIT_RESOLVING = re.compile(r'Resolving deltas:\s+(\d+)%\s+\((\d+)/(\d+)\)')
RE_GIT_COUNTING = re.compile(r'Counting objects:\s+(\d+)%\s+\((\d+)/(\d+)\)')
RE_GIT_BYTES = re.compile(r'([\d.]+)\s*([kKmMgG][iI]?[bB])')

# ---------- helpers ----------
def human_size(n):
    if n is None:
        return "0 B"
    n = float(n)
    units = ['B','KB','MB','GB','TB']
    idx = 0
    while n >= 1024 and idx < len(units)-1:
        n /= 1024.0
        idx += 1
    return f"{n:.2f} {units[idx]}"

def size_bytes_from_str(value_str, unit_str):
    """Convert strings like '1.23' and 'MiB' into bytes."""
    try:
        v = float(value_str)
    except:
        return None
    u = unit_str.lower()
    if u.startswith('k'):
        return int(v * 1024)
    if u.startswith('m'):
        return int(v * 1024**2)
    if u.startswith('g'):
        return int(v * 1024**3)
    return int(v)

def dir_size(path):
    total = 0
    for root, _, files in os.walk(path):
        for f in files:
            try:
                total += os.path.getsize(os.path.join(root, f))
            except:
                pass
    return total

def ensure_dir(p):
    os.makedirs(p, exist_ok=True)

# Run git clone in a subprocess and stream stderr to parse progress (best effort).
def stream_git_clone(repo_url, dest_dir, branch=None, depth=1, allow_unshallow=False):
    """
    Returns (success_bool, stdout+stderr combined string)
    Streams stderr and prints progress lines in-place.
    """
    cmd = ["git", "clone", repo_url, dest_dir, "--progress"]
    if branch and depth:
        # try shallow branch clone first
        cmd = ["git", "clone", "--depth", str(depth), "--branch", branch, repo_url, dest_dir, "--progress"]
    # If dest exists, skip
    if os.path.isdir(dest_dir) and os.path.isdir(os.path.join(dest_dir, ".git")):
        return True, "already exists"
    try:
        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, bufsize=1)
    except Exception as e:
        return False, str(e)

    stderr_buffer = ""
    last_print = ""
    try:
        # read stderr line by line to parse progress
        while True:
            line = proc.stderr.readline()
            if line == '' and proc.poll() is not None:
                break
            if line:
                stderr_buffer += line
                # try to parse receiving objects
                m = RE_GIT_RECEIVING.search(line)
                if m:
                    pct = int(m.group(1))
                    bytes_str = m.group(4)
                    unit = m.group(5)
                    bytes_parsed = size_bytes_from_str(bytes_str.replace(',',''), unit)
                    status = f"[git] Receiving objects: {pct}% — {bytes_str} {unit}"
                    # print status in-place
                    print("\r" + status.ljust(80), end='', flush=True)
                    last_print = status
                else:
                    # fallback: show trimmed stderr line for info
                    trimmed = line.strip()
                    if trimmed:
                        # show short info
                        print("\r" + ("[git] " + trimmed)[:80].ljust(80), end='', flush=True)
                        last_print = trimmed
        # wait for completion
        rc = proc.wait()
        print("\r" + " " * 80, end='\r')  # clear line
        if rc != 0:
            return False, stderr_buffer
        return True, stderr_buffer
    except Exception as e:
        proc.kill()
        return False, str(e)

# Try to checkout commit if commit-ish provided
def checkout_commit(dest_dir, commit):
    try:
        proc = subprocess.run(["git", "checkout", commit], cwd=dest_dir, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        if proc.returncode == 0:
            return True, proc.stdout + proc.stderr
        # maybe shallow clone; try fetching
        proc2 = subprocess.run(["git", "fetch", "--unshallow"], cwd=dest_dir, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        proc3 = subprocess.run(["git", "checkout", commit], cwd=dest_dir, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        return proc3.returncode == 0, proc2.stdout + proc2.stderr + proc3.stdout + proc3.stderr
    except Exception as e:
        return False, str(e)

# Replace occurrences in HTML/text more intelligently
def smart_rewrite_content(content, repo_map, assets_dir):
    """
    - repo_map: mapping of normalized key -> local_dirname
      normalized key examples: github.com/user/repo@branch_or_commit
    - Attempt to replace:
      * exact occurrences of cdn.jsdelivr.net/gh/... (full)
      * rawcdn.githack.com/...
      * raw.githubusercontent.com/...
      * github.com/.../blob/... or tree/... (best-effort)
      * any matched 'original' snippets saved earlier
    Returns (new_content, list_of_replacements)
    """
    replacements = []

    # 1) replace jsdelivr occurrences
    def replace_jsdelivr(m):
        user, repo, branch, path = m.groups()
        branch = branch or "main"
        key_try = f"github.com/{user}/{repo}@{branch}"
        local = None
        if key_try in repo_map:
            local = repo_map[key_try]
        else:
            # try any branch for this user/repo
            for k in repo_map:
                if k.startswith(f"github.com/{user}/{repo}@"):
                    local = repo_map[k]
                    break
        if local:
            new = f"./{assets_dir}/{local}/{path}"
            replacements.append((m.group(0), new))
            return new
        return m.group(0)

    content = PD_JSDELIVR.sub(replace_jsdelivr, content)

    # 2) replace rawcdn.githack
    def replace_githack(m):
        user, repo, commit, path = m.groups()
        key_try = f"github.com/{user}/{repo}@{commit}"
        local = None
        if key_try in repo_map:
            local = repo_map[key_try]
        else:
            # fallback to any branch
            for k in repo_map:
                if k.startswith(f"github.com/{user}/{repo}@"):
                    local = repo_map[k]
                    break
        if local:
            new = f"./{assets_dir}/{local}/{path}"
            replacements.append((m.group(0), new))
            return new
        return m.group(0)

    content = PD_GITHACK.sub(replace_githack, content)

    # 3) replace raw.githubusercontent
    def replace_raw(m):
        user, repo, branch, path = m.groups()
        key_try = f"github.com/{user}/{repo}@{branch}"
        local = None
        if key_try in repo_map:
            local = repo_map[key_try]
        else:
            for k in repo_map:
                if k.startswith(f"github.com/{user}/{repo}@"):
                    local = repo_map[k]
                    break
        if local:
            new = f"./{assets_dir}/{local}/{path}"
            replacements.append((m.group(0), new))
            return new
        return m.group(0)

    content = PD_RAW_GH.sub(replace_raw, content)

    # 4) replace github.com/blob/tree occurrences (best-effort)
    def replace_github_generic(m):
        user, repo, branch = m.groups()
        branch = branch or "main"
        key_try = f"github.com/{user}/{repo}@{branch}"
        local = None
        for k in repo_map:
            if k.startswith(f"github.com/{user}/{repo}@"):
                local = repo_map[k]
                break
        if local:
            # we can't perfectly map to path, but replace base github URL to local root
            base = m.group(0)
            # attempt to find path after 'blob/<branch>/' inside original content; leave rest unchanged
            # we'll just replace the 'https://github.com/user/repo' part with ./assets/.../
            prefix = f"https://github.com/{user}/{repo}"
            new_prefix = f"./{assets_dir}/{local}"
            return m.group(0).replace(prefix, new_prefix)
        return m.group(0)

    content = PD_GITHUB_GENERIC.sub(replace_github_generic, content)

    # 5) handle <base href="..."> specially if now pointing to local asset root
    base_match = PD_BASE.search(content)
    if base_match:
        base_url = base_match.group(1)
        # try to map base url to repo_map entries
        for k, local in repo_map.items():
            parts = k.split('/')
            if len(parts) >= 3:
                user_k = parts[1]
                repo_k = parts[2].split('@')[0]
                if user_k in base_url and repo_k in base_url:
                    new_base = f"./{assets_dir}/{local}/"
                    content = content.replace(base_url, new_base)
                    replacements.append((base_url, new_base))
                    break

    # 6) replace any remaining occurrences (generic url attributes) - best-effort loop
    def generic_replace_urls(s):
        # find urls via PD_URL_GENERIC and try to replace any that contain known cdn keys
        def repl(m):
            for g in range(1,4):
                url = m.group(g)
                if not url:
                    continue
                # check if url contains any known key patterns
                for k, local in repo_map.items():
                    user_repo = '/'.join(k.split('/')[1:3])  # user/repo@branch
                    user_repo_base = user_repo.split('@')[0]
                    if user_repo_base in url:
                        # build local path preserving trailing path segment
                        # find path segment after user_repo_base in url
                        idx = url.find(user_repo_base)
                        suffix = url[idx + len(user_repo_base):].lstrip('/\\')
                        new = f"./{assets_dir}/{local}/{suffix}"
                        replacements.append((url, new))
                        return m.group(0).replace(url, new)
            return m.group(0)
        return PD_URL_GENERIC.sub(repl, s)
    content = generic_replace_urls(content)

    return content, replacements

# ---------- main ----------
def main(args):
    html_dir = args.html_dir
    zones_file = args.zones
    assets_dir = args.assets_dir
    out_txt = args.out_txt
    out_json = args.out_json
    out_csv = args.out_csv
    dry_run = args.dry_run
    force = args.force

    # load zones
    zones = []
    zone_by_file = {}
    zone_by_id = {}
    if os.path.exists(zones_file):
        try:
            with open(zones_file, 'r', encoding='utf-8') as f:
                zones = json.load(f)
            for z in zones:
                zid = z.get('id')
                name = z.get('name','')
                url = z.get('url','')
                m = re.search(r'/([\w\-\_\.]+\.html)$', url)
                if m:
                    zone_by_file[m.group(1)] = (zid, name)
                zone_by_id[zid] = name
        except Exception as e:
            print("Warning: couldn't load zones.json:", e)

    # gather html files
    all_html = []
    for root, _, files in os.walk(html_dir):
        for fn in files:
            if fn.lower().endswith('.html'):
                all_html.append(os.path.join(root, fn))
    print(f"Found {len(all_html)} .html files under {html_dir}")

    # scan files for sources
    file_matches = {}
    repo_keys = set()
    key_examples = defaultdict(list)
    for fp in sorted(all_html):
        try:
            with open(fp, 'r', encoding='utf-8', errors='ignore') as f:
                txt = f.read()
        except Exception as e:
            print(f"ERROR reading {fp}: {e}")
            continue
        matches = []
        # find all detailed patterns
        for m in PD_JSDELIVR.finditer(txt):
            user, repo, branch, path = m.groups()
            branch = branch or "main"
            matches.append(("jsdelivr", user, repo, branch, path, m.group(0)))
            repo_keys.add(f"github.com/{user}/{repo}@{branch}")
        for m in PD_GITHACK.finditer(txt):
            user, repo, commit, path = m.groups()
            matches.append(("githack", user, repo, commit, path, m.group(0)))
            repo_keys.add(f"github.com/{user}/{repo}@{commit}")
        for m in PD_RAW_GH.finditer(txt):
            user, repo, branch, path = m.groups()
            matches.append(("raw", user, repo, branch, path, m.group(0)))
            repo_keys.add(f"github.com/{user}/{repo}@{branch}")
        for m in PD_GITHUB_GENERIC.finditer(txt):
            user, repo, branch = m.groups()
            branch = branch or "main"
            matches.append(("github", user, repo, branch, "", m.group(0)))
            repo_keys.add(f"github.com/{user}/{repo}@{branch}")
        # base-other
        base = PD_BASE.search(txt)
        if base:
            url = base.group(1)
            # include base-other to attempt mapping later
            matches.append(("base-other", url, "", "", "", url))
        file_matches[fp] = matches

    if not repo_keys:
        print("No GitHub-like repos found. Attempting to rewrite only absolute cdn links if present.")
    else:
        print(f"Found {len(repo_keys)} unique repo keys to clone.")

    ensure_dir(assets_dir)

    # repo_map: normalized key -> local_dirname
    repo_map = {}
    cloned_info = {}
    total_bytes = 0

    # Clone each repo key
    for key in sorted(repo_keys):
        # parse key: github.com/user/repo@branchOrCommit
        m = re.match(r'github\.com/([^/]+)/([^@]+)@(.+)', key)
        if not m:
            cloned_info[key] = {"success": False, "msg": "bad-key", "local": None, "bytes": 0}
            continue
        user, repo, branch_or_commit = m.groups()
        local_dir = f"{user}_{repo}"
        dest_dir = os.path.join(assets_dir, local_dir)
        repo_url = f"https://github.com/{user}/{repo}.git"

        print("\n" + "="*80)
        print(f"Processing {key} -> {dest_dir}")
        if dry_run:
            print("DRY RUN: skipping clone")
            repo_map[key] = local_dir
            cloned_info[key] = {"success": True, "msg": "dry-run", "local": local_dir, "bytes": 0}
            continue

        # if already exists and not force, skip clone
        if os.path.isdir(dest_dir) and os.path.isdir(os.path.join(dest_dir, ".git")):
            if force:
                print("Removing existing repo (force) ...")
                shutil.rmtree(dest_dir)
            else:
                size_b = dir_size(dest_dir)
                total_bytes += size_b
                repo_map[key] = local_dir
                cloned_info[key] = {"success": True, "msg": "already-exists", "local": local_dir, "bytes": size_b}
                print(f"Already cloned: {dest_dir} ({human_size(size_b)})")
                continue

        # determine if branch_or_commit is likely a commit hash
        is_hash = bool(re.fullmatch(r'[0-9a-fA-F]{7,40}', branch_or_commit))
        # attempt shallow branch clone if not a hash
        branch = None if is_hash else branch_or_commit

        # attempt streaming clone
        print(f"Cloning {repo_url} (branch/commit: {branch_or_commit}) ...")
        success, msg = stream_git_clone(repo_url, dest_dir, branch=branch, depth=1)
        if not success:
            # fallback: full clone
            print("Shallow clone failed or not sufficient. Trying full clone ...")
            try:
                rc = subprocess.run(["git", "clone", repo_url, dest_dir], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
                success = (rc.returncode == 0)
                msg += "\n" + (rc.stdout + rc.stderr)
            except Exception as e:
                success = False
                msg += "\nException: " + str(e)

        if not success:
            print(f"Clone failed for {key}: see message snippet:")
            print(msg[:1000])
            cloned_info[key] = {"success": False, "msg": msg, "local": None, "bytes": 0}
            continue

        # if commit hash, try checkout
        if is_hash:
            ok, outmsg = checkout_commit(dest_dir, branch_or_commit)
            if not ok:
                print(f"Warning: could not checkout commit {branch_or_commit} for {key}. Output: {outmsg[:400]}")

        # measure size
        size_b = dir_size(dest_dir)
        total_bytes += size_b
        repo_map[key] = local_dir
        cloned_info[key] = {"success": True, "msg": msg, "local": local_dir, "bytes": size_b}
        print(f"Cloned {key} -> {dest_dir} ({human_size(size_b)}). Cumulative: {human_size(total_bytes)}")

    # Now perform smart rewrites of HTML files
    print("\nRewriting HTML files to use local assets...")
    rewritten = []
    mapping_rows = []
    for fp, matches in file_matches.items():
        try:
            with open(fp, 'r', encoding='utf-8', errors='ignore') as f:
                orig = f.read()
        except Exception as e:
            print(f"Error reading {fp}: {e}")
            continue

        new_content, replacements = smart_rewrite_content(orig, repo_map, assets_dir)

        if new_content != orig:
            # backup and write
            bak = fp + ".bak"
            if not os.path.exists(bak):
                try:
                    shutil.copy2(fp, bak)
                except Exception as e:
                    print(f"Warning: could not write backup for {fp}: {e}")
            try:
                with open(fp, 'w', encoding='utf-8') as out:
                    out.write(new_content)
                rewritten.append(fp)
                # build mapping rows for CSV
                gid = None
                title_guess = None
                # try to infer id and name via zones mapping or patterns
                m_id = PD_CANONICAL_ID.search(orig) or PD_TITLE_GAME_ID.search(orig)
                if m_id:
                    try:
                        gid = int(m_id.group(1))
                    except:
                        gid = None
                zname = zone_by_file_match(fp := os.path.basename(fp), zones_file=args.zones) if False else None
                mapping_rows.append({
                    "file": fp,
                    "replacements": "; ".join([f"{a} -> {b}" for a,b in replacements]) if replacements else "",
                    "id": gid or "",
                    "name": zname or ""
                })
                print(f"Rewrote {fp} ({len(replacements)} replacements)")
            except Exception as e:
                print(f"Error writing {fp}: {e}")

    # produce reports
    report_txt = out_txt
    report_json = out_json
    report_csv = out_csv

    with open(report_txt, 'w', encoding='utf-8') as out:
        out.write("CLONE & LOCALIZE REPORT\n\n")
        out.write(f"HTML dir: {html_dir}\nAssets dir: {assets_dir}\n\n")
        out.write("Cloned repos:\n")
        for k, info in cloned_info.items():
            out.write(f"- {k} -> {info.get('local')} | success={info.get('success')} | size={human_size(info.get('bytes'))}\n")
        out.write("\nRewritten HTML files:\n")
        for p in rewritten:
            out.write(f"- {p}\n")
        out.write(f"\nTotal assets size: {human_size(total_bytes)}\n")

    out_json_data = {
        "html_dir": html_dir,
        "assets_dir": assets_dir,
        "cloned": cloned_info,
        "rewritten": rewritten,
        "total_bytes": total_bytes,
        "repo_map": repo_map
    }
    with open(report_json, 'w', encoding='utf-8') as j:
        json.dump(out_json_data, j, indent=2, ensure_ascii=False)

    # CSV: simple rows for each rewritten file (if mapping_rows filled)
    # mapping_rows may be empty if replacements list wasn't built — try a safe alternative:
    try:
        with open(report_csv, 'w', newline='', encoding='utf-8') as csvf:
            writer = csv.DictWriter(csvf, fieldnames=["file","replacements","id","name"])
            writer.writeheader()
            for row in mapping_rows:
                writer.writerow(row)
    except Exception:
        # create empty csv
        with open(report_csv, 'w', newline='', encoding='utf-8') as csvf:
            csvf.write("file,replacements,id,name\n")

    print("\nDONE.")
    print(f"Cloned repos: {len([k for k,v in cloned_info.items() if v.get('success')])}")
    print(f"Total cloned size: {human_size(total_bytes)}")
    print(f"HTML files rewritten: {len(rewritten)}")
    print(f"Reports: {report_txt}, {report_json}, {report_csv}")

# Helper to attempt mapping file->zones (best-effort; returns name or None)
def zone_by_file_match(filename, zones_file):
    if not zones_file or not os.path.exists(zones_file):
        return None
    try:
        with open(zones_file, 'r', encoding='utf-8') as f:
            zones = json.load(f)
        for z in zones:
            url = z.get('url','')
            m = re.search(r'/([\w\-\_\.]+\.html)$', url)
            if m and m.group(1) == filename:
                return z.get('name')
    except Exception:
        return None
    return None

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Clone repos referenced by HTMLs into assets/ and rewrite HTML to local assets.")
    p.add_argument('--html-dir', default='.', help='Directory containing HTML files (default current dir)')
    p.add_argument('--zones', default='zones.json', help='Path to zones.json (optional, used to map ids->names)')
    p.add_argument('--assets-dir', default='assets', help='Directory to clone repos into (default ./assets)')
    p.add_argument('--out-txt', default='gamesources_local.txt', help='Human report')
    p.add_argument('--out-json', default='gamesources_local.json', help='JSON report')
    p.add_argument('--out-csv', default='gamesources_local.csv', help='CSV mapping of rewritten files')
    p.add_argument('--dry-run', action='store_true', help='Do not actually git clone; simulate only')
    p.add_argument('--force', action='store_true', help='Re-clone repos even if assets/<user_repo> exists (deletes it)')
    args = p.parse_args()
    main(args)
