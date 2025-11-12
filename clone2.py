#!/usr/bin/env python3
"""
Advanced GitHub Asset Localizer
--------------------------------
- Finds all GitHub CDN URLs in HTML files (jsdelivr, githack, raw.githubusercontent).
- Downloads only the specific files used (not full repos).
- Respects GitHub API rate limits.
- Rewrites HTML files to reference local paths.

Usage:
    python3 clone2.py --html-dir . --assets-dir assets
"""

import os, re, time, requests, argparse, shutil
from collections import defaultdict

# ======== CONFIG ========
GITHUB_TOKEN = os.getenv(
    "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", 
    ""
)  # optional: increases rate limit to 5000/hr
MAX_REQUESTS_PER_MIN = 300  # configurable rate limit
REQUEST_INTERVAL = 60 / MAX_REQUESTS_PER_MIN
HEADERS = {"User-Agent": "localizer/2.0"}
if GITHUB_TOKEN:
    HEADERS["Authorization"] = f"token {GITHUB_TOKEN}"

# ======== URL Patterns ========
PATTERNS = {
    "jsdelivr": re.compile(
        r'https?://(?:cdn\.jsdelivr\.(?:net|com|org|io))/gh/([^/]+)/([^/@]+)(?:@([^/]+))?/([^"\'\s]+)',
        re.IGNORECASE,
    ),
    "githack": re.compile(
        r'https?://rawcdn\.githack\.com/([^/]+)/([^/]+)/([^/]+)/([^"\'\s]+)',
        re.IGNORECASE,
    ),
    "raw": re.compile(
        r'https?://raw\.githubusercontent\.com/([^/]+)/([^/]+)/([^/]+)/([^"\'\s]+)',
        re.IGNORECASE,
    ),
}

# ======== Helpers ========
def safe_path(path: str) -> str:
    return path.replace("..", "").replace("\\", "/")

def find_sources(text: str):
    """Extract all matching GitHub URLs from HTML text."""
    matches = []
    for key, pat in PATTERNS.items():
        for m in pat.finditer(text):
            groups = list(m.groups())
            # Normalize missing branch → assume 'main'
            if len(groups) >= 3 and not groups[2]:
                groups[2] = "main"
            matches.append((key, *groups, m.group(0)))
    return matches

def download_file(user, repo, branch, subpath, dest_path):
    """Download one file with retries and rate limiting."""
    url = f"https://raw.githubusercontent.com/{user}/{repo}/{branch}/{subpath}"
    os.makedirs(os.path.dirname(dest_path), exist_ok=True)

    if os.path.exists(dest_path):
        print(f"✅ Already exists: {dest_path}")
        return

    for attempt in range(3):
        try:
            print(f"⬇️  [{user}/{repo}] {subpath}")
            r = requests.get(url, headers=HEADERS)
            if r.status_code == 200:
                with open(dest_path, "wb") as f:
                    f.write(r.content)
                print(f"✅ Saved → {dest_path}")
                break
            elif r.status_code == 403:
                print("⚠️ Hit rate limit — sleeping 60s...")
                time.sleep(60)
            else:
                print(f"❌ {r.status_code} on {url}")
                break
        except Exception as e:
            print(f"⚠️ Network error ({e}), retrying...")
            time.sleep(2)
        finally:
            time.sleep(REQUEST_INTERVAL)

def rewrite_html(filepath, matches, assets_dir):
    """Replace remote GitHub URLs in HTML with local paths."""
    with open(filepath, "r", encoding="utf-8", errors="ignore") as f:
        content = f.read()
    original = content

    for m in matches:
        provider, user, repo, branch, subpath, full_url = m
        branch = branch or "main"
        local_rel = f"./{assets_dir}/{user}_{repo}/{branch}/{safe_path(subpath)}"
        content = content.replace(full_url, local_rel)

    if content != original:
        shutil.copy2(filepath, filepath + ".bak")
        with open(filepath, "w", encoding="utf-8") as f:
            f.write(content)
        print(f"✏️  Rewrote {os.path.basename(filepath)} → local asset paths")

def main(html_dir, assets_dir):
    os.makedirs(assets_dir, exist_ok=True)

    # Gather all HTML files
    html_files = [
        os.path.join(dp, f)
        for dp, _, fs in os.walk(html_dir)
        for f in fs if f.lower().endswith(".html")
    ]

    repo_files = defaultdict(set)
    all_matches = []

    # Extract all GitHub file URLs
    for html_file in html_files:
        try:
            text = open(html_file, encoding="utf-8", errors="ignore").read()
        except Exception:
            continue
        matches = find_sources(text)
        all_matches.extend(matches)
        for _, user, repo, branch, subpath, full_url in matches:
            branch = branch or "main"
            key = (user, repo, branch)
            repo_files[key].add(subpath)

    print(f"\n📦 Found {len(repo_files)} repositories to process.\n")

    # Download missing files
    for (user, repo, branch), files in repo_files.items():
        branch = branch or "main"
        for subpath in sorted(files):
            dest_path = os.path.join(assets_dir, f"{user}_{repo}", branch, subpath)
            download_file(user, repo, branch, subpath, dest_path)

    print("\n📝 Rewriting HTML files to local references...\n")
    for html_file in html_files:
        try:
            text = open(html_file, encoding="utf-8", errors="ignore").read()
            matches = find_sources(text)
            if matches:
                rewrite_html(html_file, matches, assets_dir)
        except Exception as e:
            print(f"⚠️ Could not process {html_file}: {e}")

    print("\n🎉 Done! All required GitHub assets have been downloaded and HTML updated.")

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Download only required GitHub assets from HTML files.")
    p.add_argument("--html-dir", default=".", help="Directory containing HTML files")
    p.add_argument("--assets-dir", default="assets", help="Where to save downloaded assets")
    args = p.parse_args()
    main(args.html_dir, args.assets_dir)
