import os
import sys


dir_name = os.path.dirname(__file__).replace(f"test", "")
if sys.path.__contains__(dir_name) is False:
    sys.path.append(dir_name)

from lib.api.GithubHelper import GithubAPI

api = GithubAPI()
org = "SeleniumHQ"
sort_by = "updated_at"
print("How many total open issues are there across all repositories?")
print(
    f'Total: {api.get_issues_count_accross_all_repos(org).get("total_issues")} issues'
)
print("*" * 100)
print("Sort the repositories by date updated in descending order")
repos = api.sort_repos(org, sort_by, desc=True)
for repo in repos:
    print(f"Updated At: {repo.get('updated_at')}, Repo: {repo.get('full_name')}")
print("*" * 100)
print("Which repository has the most watchers?")
repo = api.get_repo_that_has_most_watchers(org)
print(
    f"Repo Name: {repo.get('full_name')}, Watchers Count: {repo.get('watchers_count')}"
)
