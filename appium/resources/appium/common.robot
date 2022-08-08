*** Settings ***
Library    Collections
Library    String
Library    AppiumLibrary
Library    BuiltIn
Variables    ${EXECDIR}/data/appium/${ENV}.yaml
Variables    ${EXECDIR}/locators/appium/${ENV}.yaml


*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_APP}                ${EXECDIR}/app/${ENV}/VSee-vsee-beta.apk
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=11}
${ANDROID_APP_PACKAGE}        com.vsee.vsee.beta
${ANDROID_DEVICE_NAME}        emulator-5554
${ANDROID_APP_ACTIVITY}       com.vsee.activity.LaunchActivity
${GLOBAL_TIMEOUT}             1m


*** Keywords ***
Open Android Test App
  [Arguments]    ${appActivity}=${ANDROID_APP_ACTIVITY}
  Open Application  http://127.0.0.1:4723/wd/hub
  ...  automationName=${ANDROID_AUTOMATION_NAME}
  ...  deviceName=${ANDROID_DEVICE_NAME}
  ...  app=${ANDROID_APP}
  ...  platformName=${ANDROID_PLATFORM_NAME}
  ...  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  appPackage=${ANDROID_APP_PACKAGE}
  ...  appActivity=${appActivity}

