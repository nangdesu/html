import re
import requests
import time

# GitHub API URL format
API_URL = "https://api.github.com/repos/{}/{}"
RATE_LIMIT_URL = "https://api.github.com/rate_limit"

# Your GitHub token (replace with your token)
GITHUB_TOKEN = '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'

# Headers for authentication
HEADERS = {
    'Authorization': f'token {GITHUB_TOKEN}'
}

# Function to check rate limit status
def check_rate_limit():
    response = requests.get(RATE_LIMIT_URL, headers=HEADERS)
    if response.status_code == 200:
        data = response.json()
        remaining = data['resources']['core']['remaining']
        reset_time = data['resources']['core']['reset']
        return remaining, reset_time
    else:
        print("Error checking rate limit.")
        return 0, 0

# Function to get repository size using GitHub API
def get_repo_size(owner, repo):
    try:
        # Check rate limit before making a request
        remaining, reset_time = check_rate_limit()
        if remaining == 0:
            reset_in_seconds = reset_time - int(time.time())
            print(f"Rate limit exceeded. Waiting for {reset_in_seconds} seconds.")
            time.sleep(reset_in_seconds + 5)  # Wait until reset time

        url = API_URL.format(owner, repo)
        response = requests.get(url, headers=HEADERS)
        if response.status_code == 200:
            data = response.json()
            return data['size']
        else:
            print(f"Error: Unable to fetch size for {owner}/{repo}. Status code: {response.status_code}")
            return 0
    except Exception as e:
        print(f"Error: {e}")
        return 0

# Function to parse the .sh script and extract GitHub URLs
def extract_github_urls(script_path):
    with open(script_path, 'r') as file:
        content = file.read()
    
    # Regular expression to extract GitHub URLs from the script
    github_urls = re.findall(r'https://github\.com/([a-zA-Z0-9_-]+)/([a-zA-Z0-9_-]+)', content)
    return github_urls

# Main function
def main(script_path):
    github_urls = extract_github_urls(script_path)
    
    total_size = 0
    repo_sizes = {}

    print("=== Repository Sizes ===")
    
    # For each URL found, fetch the size from GitHub API
    for owner, repo in github_urls:
        print(f"Fetching size for {owner}/{repo}...")
        size = get_repo_size(owner, repo)
        repo_sizes[f"{owner}/{repo}"] = size
        total_size += size
        print(f"Size of {owner}/{repo}: {size} KB\n")

    # Output the total size of all repositories
    print("=== Total Repository Size ===")
    print(f"Total size of all repositories: {total_size} KB")
    
    # Optionally: Save the results to a file
    with open('repo_sizes.txt', 'w') as f:
        for repo, size in repo_sizes.items():
            f.write(f"{repo}: {size} KB\n")
        f.write(f"\nTotal size: {total_size} KB\n")

# Run the script
if __name__ == "__main__":
    # Path to the shell script
    script_path = 'clone_all.sh'  # Replace with the path to your shell script
    main(script_path)
