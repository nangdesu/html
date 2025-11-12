#!/usr/bin/env python3
"""
build_clone_script_and_localize.py

Step 1️⃣: Run this script to generate `clone_all.sh`.
Step 2️⃣: Run `bash clone_all.sh` to clone all repos.
Step 3️⃣: Re-run this same script — it will detect the local clones and rewrite HTML files to use them.
"""

import os, re, json, argparse, shutil
from collections import defaultdict

# --- regex patterns ---
PATTERNS = {
    "jsdelivr": re.compile(
        r'https?://(?:cdn\.jsdelivr\.net|cdn.jsdelivr.net)/gh/([^/]+)/([^/@/]+)(?:@([^/]+))?/([^"\)\s\']*)',
        re.IGNORECASE),
    "githack": re.compile(
        r'https?://rawcdn\.githack\.com/([^/]+)/([^/]+)/([^/]+)/([^"\)\s\']*)',
        re.IGNORECASE),
    "raw": re.compile(
        r'https?://raw\.githubusercontent\.com/([^/]+)/([^/]+)/([^/]+)/([^"\)\s\']*)',
        re.IGNORECASE)
}

PD_BASE = re.compile(r'<base\s+href=["\']([^"\']+)["\']', re.IGNORECASE)
PD_TITLE_GAME_ID = re.compile(r'Game\s+(\d+)', re.IGNORECASE)
PD_CANONICAL_ID = re.compile(r'<link[^>]+rel=["\']canonical["\'][^>]+href=["\'][^"\']*/(\d+)/?["\']', re.IGNORECASE)

def find_sources(text):
    matches = []
    for key, pat in PATTERNS.items():
        for m in pat.finditer(text):
            matches.append((key, *m.groups(), m.group(0)))
    return matches

def extract_game_id(text, filename):
    for pat in [PD_CANONICAL_ID, PD_TITLE_GAME_ID]:
        m = pat.search(text)
        if m:
            return m.group(1)
    m = re.search(r'(\d+)\.html$', filename)
    return m.group(1) if m else None

def detect_existing_repos(assets_dir):
    existing = {}
    if not os.path.exists(assets_dir):
        return existing
    for name in os.listdir(assets_dir):
        path = os.path.join(assets_dir, name)
        if os.path.isdir(path):
            existing[name] = True
    return existing

def generate_clone_script(repo_keys, assets_dir, filename="clone_all.sh"):
    lines = [
        "#!/bin/bash",
        f"mkdir -p {assets_dir}",
        f"cd {assets_dir}",
        "",
        "echo '=== Cloning all required repositories ==='"
    ]
    for key in sorted(repo_keys):
        m = re.match(r'github\.com/([^/]+)/([^@]+)@(.+)', key)
        if not m: continue
        user, repo, branch_or_commit = m.groups()
        local_dir = f"{user}_{repo}"
        repo_url = f"https://github.com/{user}/{repo}.git"
        if re.fullmatch(r"[0-9a-fA-F]{7,40}", branch_or_commit):
            lines += [
                f'if [ ! -d "{local_dir}" ]; then',
                f'  echo "Cloning commit {branch_or_commit} from {user}/{repo}..."',
                f'  git clone {repo_url} {local_dir} && cd {local_dir} && git checkout {branch_or_commit} && cd ..',
                "fi", ""
            ]
        else:
            lines += [
                f'if [ ! -d "{local_dir}" ]; then',
                f'  echo "Cloning branch {branch_or_commit} from {user}/{repo}..."',
                f'  git clone --depth 1 --branch {branch_or_commit} {repo_url} {local_dir}',
                "fi", ""
            ]
    lines.append('echo "✅ All repos cloned into ./assets"')
    with open(filename, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    os.chmod(filename, 0o755)
    print(f"✅ Wrote {filename} — copy/paste or run: ./clone_all.sh")

def rewrite_html(filepath, matches, repo_map, assets_dir):
    with open(filepath, "r", encoding="utf-8", errors="ignore") as f:
        content = f.read()
    original = content
    for m in matches:
        provider, user, repo, branch, subpath, full_url = m
        key = f"github.com/{user}/{repo}@{branch}"
        local_dir = repo_map.get(key)
        if not local_dir: continue
        new_path = f"./{assets_dir}/{local_dir}/{subpath}" if subpath else f"./{assets_dir}/{local_dir}/"
        content = content.replace(full_url, new_path)
    if content != original:
        shutil.copy2(filepath, filepath + ".bak")
        with open(filepath, "w", encoding="utf-8") as f:
            f.write(content)
        print(f"✏️  Rewrote {os.path.basename(filepath)} → local paths")

def main(html_dir, assets_dir, zones_file, clone_script):
    os.makedirs(assets_dir, exist_ok=True)
    repo_keys = set()
    repo_map = {}

    # load zones.json if available
    zones = {}
    if os.path.exists(zones_file):
        try:
            with open(zones_file, "r") as f:
                for z in json.load(f):
                    zones[str(z.get("id"))] = z.get("name")
        except Exception:
            pass

    html_files = [os.path.join(dp, f) for dp,_,fs in os.walk(html_dir) for f in fs if f.endswith(".html")]
    for fp in html_files:
        try:
            text = open(fp, encoding="utf-8", errors="ignore").read()
        except: continue
        matches = find_sources(text)
        if not matches: continue
        for m in matches:
            _, user, repo, branch, *_ = m
            if not user or not repo or not branch: continue
            repo_keys.add(f"github.com/{user}/{repo}@{branch}")
    
    # detect if repos already cloned
    existing = detect_existing_repos(assets_dir)
    for key in sorted(repo_keys):
        m = re.match(r'github\.com/([^/]+)/([^@]+)@(.+)', key)
        if not m: continue
        user, repo, branch = m.groups()
        local_dir = f"{user}_{repo}"
        repo_map[key] = local_dir

    # If no local repos yet, build clone script
    missing = [r for r in repo_map.values() if r not in existing]
    if missing:
        generate_clone_script(repo_keys, assets_dir, clone_script)
        print(f"\n⚙️  Now run:\n\n  chmod +x {clone_script}\n  ./{clone_script}\n\nThen re-run this Python script to rewrite HTML files.")
        return

    # If assets already exist, rewrite HTML
    print("✅ All repos already cloned — rewriting HTML files to use local assets...\n")
    for fp in html_files:
        try:
            text = open(fp, encoding="utf-8", errors="ignore").read()
        except: continue
        matches = find_sources(text)
        if matches:
            rewrite_html(fp, matches, repo_map, assets_dir)

    print("\n🎉 Done! All HTMLs now point to local ./assets copies.\nBackups saved as .bak files.")

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Generate clone_all.sh and rewrite HTML for local assets")
    p.add_argument("--html-dir", default=".", help="Directory with HTML files")
    p.add_argument("--assets-dir", default="assets", help="Where to clone repos")
    p.add_argument("--zones", default="zones.json", help="zones.json path (optional)")
    p.add_argument("--clone-script", default="clone_all.sh", help="Shell script output name")
    args = p.parse_args()
    main(args.html_dir, args.assets_dir, args.zones, args.clone_script)
