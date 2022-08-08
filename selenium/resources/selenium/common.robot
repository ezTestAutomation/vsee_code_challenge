*** Settings ***
Library      Collections
Library      String
Library      SeleniumLibrary
Library      ${EXECDIR}/core_lib/EnvHandler.py
Variables    ${EXECDIR}/data/selenium/${ENV}.yaml
Variables    ${EXECDIR}/locators/selenium/${ENV}.yaml

*** Variables ***
${Browser}    Chrome
${Timeout}    1m

*** Keywords ***
Navigate To Home Page
    Install Chrome Driver
    Open Browser    ${BASE_URL}    ${Browser}
    Maximize Browser Window


Scroll To Element
    [Arguments]    ${locator}
    ${x}=    Get Horizontal Position    ${locator}
    ${y}=    Get Vertical Position    ${locator}
    Execute Javascript    window.scrollTo(${x}, ${y}); setTimeout(() => {console.log(${x} +", " + ${y})}, 500);


Quick Clear Input Text
    [Arguments]    ${locator}
    Press Keys    ${locator}    CTRL+a
    Press Keys    ${locator}    BACKSPACE


Clear Input Text
    [Arguments]    ${locator}
    ${value}=    Get Element Attribute    ${locator}    value
    ${backspaces count}=    Get Length    ${value}
    Run Keyword If    """${value}""" != ''
    ...    Repeat Keyword    ${backspaces count +1}    Press Keys    ${locator}    BACKSPACE


Disable Capture Page Screenshot On Failure
    Register Keyword To Run On Failure    NONE


Enable Capture Page Screenshot On Failure
    Register Keyword To Run On Failure    Capture Page Screenshot