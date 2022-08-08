# install virtual env
python3 -m pip install --upgrade virtualenv
python3 -m venv venv

# activate virtual environment and install libraries
# active virtual env in windows
# . venv/Scripts/activate
# active virtual env in mac / linux
. venv/bin/activate
python -m pip install --upgrade pip
pip install -r requirements.txt

# Run test script
python test/test_github_api.py
deactivate