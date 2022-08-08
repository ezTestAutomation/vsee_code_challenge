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

# remove previous reports
rm -rf reports*/*
# setting for robotframework
test_suite="chat"
suite_folder="Test_Suites"
env="staging"
# Run all test in test_suite
echo ================================ Env: $env =====================================
robot -d reports_$env -v env:$env -s $test_suite --exclude unstable $suite_folder
echo ================================================================================
deactivate