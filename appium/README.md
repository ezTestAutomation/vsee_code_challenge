# E2E Automated Test framework

Robot framework all in one framework

**Installation**  
[Download & install python3 & pip3](https://www.python.org/)
```bash
pip3 install -r requirements.txt
```

**Structure** (TBD)  

    .
    ├── app                       # Deritory store app *.apk used to install in android device
    ├── core_lib                  # Libraries for automated test (`requests` or utilities)
    ├── data                      # Contains test data
    ├── lib                       # Contains libs that can be called in the test resources
    ├── locators                  # Contains the test's data
    ├── reports                   # [OPTIONAL] you MUST NOT commit this folder to the repository
    ├── resources                 # RF User defined keywords which will be used in the `Test Suites` or other keywords
    ├── Test_Suites               # All test cases will be stored here under test suite
    ├── .env_config               # Contains all environment config as environment variable
    ├── .gitignore                          
    ├── create_venv.sh            # Bash/shell utility commands used to create virtual environment with specific python version in .env_config file
    ├── README.md
    ├── requirements.txt          # All python libraries/dependencies that need to be installed in advance 
    ├── run.sh                    # Bash/shell helper to help you run test in virtual environments which many mode
    └── venv                   # Virtual environment for python

**Usage**  
Install appium server by using NodeJS
```bash
npm install -g appium
npm install -g appium-doctor
```
Then run appium-doctor to check if all neccesary libraries installed
```bash
appium-doctor
# sample output
info AppiumDoctor Appium Doctor v.1.16.0
info AppiumDoctor ### Diagnostic for necessary dependencies starting ###
info AppiumDoctor  ✔ The Node.js binary was found at: C:\Program Files\nodejs\node.EXE
info AppiumDoctor  ✔ Node version is 16.15.1
info AppiumDoctor  ✔ ANDROID_HOME is set to: C:\Users\Admin\AppData\Local\Android\Sdk
info AppiumDoctor  ✔ JAVA_HOME is set to: C:\Program Files (x86)\Java\jre1.8.0_311
info AppiumDoctor    Checking adb, android, emulator
info AppiumDoctor      'adb' is in C:\Users\Admin\AppData\Local\Android\Sdk\platform-tools\adb.exe
info AppiumDoctor      'android' is in C:\Users\Admin\AppData\Local\Android\Sdk\tools\android.bat
info AppiumDoctor      'emulator' is in C:\Users\Admin\AppData\Local\Android\Sdk\emulator\emulator.exe
info AppiumDoctor  ✔ adb, android, emulator exist: C:\Users\Admin\AppData\Local\Android\Sdk
info AppiumDoctor  ✔ 'bin' subfolder exists under 'C:\Program Files (x86)\Java\jre1.8.0_311'
info AppiumDoctor ### Diagnostic for necessary dependencies completed, no fix needed. ###
```
If you see some red `x` in checker then you have to install / add to environment which missing

Then check again and again with `appium-doctor` until everything is OK

To Start Appium Server just run command
```bash
appium
```

And you have to reconfig those parameters in `resources/appium/common.robot` file
```bash
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=11}
${ANDROID_APP_PACKAGE}        com.vsee.vsee.beta
${ANDROID_DEVICE_NAME}        emulator-5554
${ANDROID_APP_ACTIVITY}       com.vsee.activity.LaunchActivity
```
- Change package name
- Change device name
- And android platform version
- And Android App Activity

**Install Virtual Environment**

From appium folder run:

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

There are 3 ways you can run a test by command:

`REMEMBER TO ACTIVATE VIRTUAL ENV BEFORE RUNNING THE SCRIPT BELOW`

- *Test suite:*
```bash
python -m robot -d reports -v env:"<your_environment>" -s "<your_suite_file_name_without_extension>" "Test_Suites"
```

- *Test case:*
```bash
python -m robot -d reports -v env:"<your_environment>" -t "<your_test_name>" "Test_Suites"
```

- *All Tests:*
```bash
python -m robot -d reports -v env:"<your_environment>" "Test_Suites"
```

Or you can run test with `run.sh` file
- Open `run.sh`
    + If you want to run test suite: edit the `test_suite` variable
    + If you want to run all tests in your suite folder: remove  `-s $test_suite` in run command
    + If you want to run tests in which environment change `env` variable to one of these value [`staging`, `production`]

To run `run.sh` file you have to do the following instruction. It helps you create virtual env and run with the new created virtual environment
```bash
# set permission for run.sh
chmod a+x run.sh
# run with run.sh
./run.sh
```

**View Test Report**  
Navigate to `reports` directory to view detailed report by opening report.html or log.html

