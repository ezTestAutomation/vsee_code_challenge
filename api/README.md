# E2E Automated Test framework

Robot framework all in one framework

**Installation**  
[Download & install python3 & pip3](https://www.python.org/)
```bash
pip3 install -r requirements.txt
```

**Structure** (TBD)  

    .
    ├── core_lib                  # Libraries for automated test (`requests` or utilities)
    ├── lib                       # Contains libs that can be called in the test resources
    ├── test                      # contains test file
    ├── README.md
    ├── requirements.txt          # All python libraries/dependencies that need to be installed in advance 
    ├── run.sh                    # Bash/shell helper to help you run test in virtual environments which many mode
    └── venv                      # [Optional] Virtual environment for python

**Usage**  

From api folder run:

- Install virtual environment
```bash
python3 -m pip install --upgrade virtualenv    # Install / Upgrade virtualenv library
python3 -m venv venv                           # create virtual env
```
- Install requirements library in `requirements.txt` file
```bash
. venv/bin/activate                 # activae virtual env
pip install -r requirements.txt     # Install requirements
deactivate                          # deactivate virtual env
```
If you want to check your private organization repositories you can config GithubAPI
```bash
api = GithubAPI(username="username", access_token="access_token")
```

**Running**
You can run test with file `run.sh`. It helps you create virtual env and run with the new created virtual environment
```bash
# set permission for run.sh
chmod a+x run.sh
# run with run.sh
./run.sh
```

Or run manually by running the command below
Run command:
```bash
. venv/bin/activate               # activae virtual env
python test/test_github_api.py    # run script
deactivate                        # deactivate virtual env
```
Sample result:
```bash
How many total open issues are there across all repositories?
2022-08-06 11:42:09,298 urllib3.connectionpool DEBUG    Starting new HTTPS connection (1): api.github.com:443
2022-08-06 11:42:10,076 urllib3.connectionpool DEBUG    https://api.github.com:443 "GET /orgs/SeleniumHQ/repos HTTP/1.1" 200 None
Total: 1197 issues
****************************************************************************************************
Sort the repositories by date updated in descending order
2022-08-06 11:42:10,121 urllib3.connectionpool DEBUG    https://api.github.com:443 "GET /orgs/SeleniumHQ/repos HTTP/1.1" 200 9188
Updated At: 2022-08-06T03:58:24Z, Repo: SeleniumHQ/selenium-ide
Updated At: 2022-08-06T02:46:43Z, Repo: SeleniumHQ/selenium
Updated At: 2022-08-05T21:46:39Z, Repo: SeleniumHQ/seleniumhq.github.io
Updated At: 2022-08-05T15:23:38Z, Repo: SeleniumHQ/docker-selenium
Updated At: 2022-08-04T12:53:02Z, Repo: SeleniumHQ/htmlunit-driver
Updated At: 2022-06-22T15:03:31Z, Repo: SeleniumHQ/selenium-google-code-issue-archive
Updated At: 2022-06-19T09:58:48Z, Repo: SeleniumHQ/irc-logs
Updated At: 2022-05-30T11:45:12Z, Repo: SeleniumHQ/www.seleniumhq.org
Updated At: 2022-05-27T09:39:17Z, Repo: SeleniumHQ/mobile-spec
Updated At: 2022-05-26T06:44:29Z, Repo: SeleniumHQ/fluent-selenium
Updated At: 2022-05-12T09:20:16Z, Repo: SeleniumHQ/.github
Updated At: 2022-05-11T14:41:25Z, Repo: SeleniumHQ/selenium-maven-release-test
Updated At: 2022-05-11T14:40:42Z, Repo: SeleniumHQ/buck
Updated At: 2022-05-11T14:40:18Z, Repo: SeleniumHQ/ansible-selenium
Updated At: 2022-05-11T14:40:04Z, Repo: SeleniumHQ/selenium-assistant
Updated At: 2022-05-11T14:39:35Z, Repo: SeleniumHQ/heroku-selenium
Updated At: 2022-05-11T14:38:09Z, Repo: SeleniumHQ/docs
Updated At: 2022-05-11T14:37:51Z, Repo: SeleniumHQ/rules_jvm_external
Updated At: 2022-05-11T14:37:36Z, Repo: SeleniumHQ/selbot2
****************************************************************************************************
Which repository has the most watchers?
2022-08-06 11:42:10,167 urllib3.connectionpool DEBUG    https://api.github.com:443 "GET /orgs/SeleniumHQ/repos HTTP/1.1" 200 9188
Repo Name: SeleniumHQ/selenium, Watchers Count: 24253
```
