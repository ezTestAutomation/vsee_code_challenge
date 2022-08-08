import os
import sys


dir_name = os.path.dirname(__file__).replace(f"{os.sep}lib{os.sep}api", "")
if sys.path.__contains__(dir_name) is False:
    sys.path.append(dir_name)
    
    
from lib.api.ApiModel import ApiModel

BASE_URL = "https://api.github.com"


class GithubAPI(ApiModel):
    def __init__(
        self,
        base_url: str = BASE_URL,
        username: str = None,
        access_token: str = None,
    ):
        super().__init__()
        self.base_url = base_url
        self.username = username
        self.access_token = access_token

    def get_reposipories(self, org):
        url = f"{self.base_url}/orgs/{org}/repos"

        headers = dict()
        if self.access_token:
            headers["authorization"] = f"token {self.access_token}"
        headers["cache-control"] = "no-cache"
        headers["Content-Type"] = "*/*"
        return self.send_json_request("get", url, headers=headers).get("body")

    def get_issues_count_accross_all_repos(self, org):
        result = self.get_reposipories(org)
        out = []
        total_issues = 0
        for item in result:
            if item.get("has_issues"):
                issues = item.get("open_issues_count")
                total_issues += issues
                data = {"repo_name": item.get("full_name"), "issues": issues}
                out.append(data)
        return {"repos": out, "total_issues": total_issues}

    def get_repo_that_has_most_watchers(self, org):
        return self.sort_repos(org, "watchers_count", desc=True)[0]
        

    def sort_repos(self, org, sort_by, desc: True):
        result = self.get_reposipories(org)

        def myFunc(e):
            return e[sort_by]

        result.sort(key=myFunc)
        if desc:
            result.reverse()
        return result
