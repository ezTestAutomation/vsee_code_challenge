*** Settings ***
Resource    ${EXECDIR}/resources/appium/chat_keyword.robot
Suite Setup    Open Android Test App
Suite Teardown    Close Application

*** Test Cases ***
Test Login And Send A Sample Message
    Wait Until Login Page Showed
    Enter Email Address    ${VSEE_APP_ACCOUNT.EMAIL}
    Enter Password    ${VSEE_APP_ACCOUNT.PASSWORD}
    Click Sign In Button
    Wait Until Login Successfully
    Click On Chat Menu Item
    Wait Until It Navigate To Chat Page
    Click On New Chat Button
    Wait Until Search Contact Page Showed
    Click On Search Contact Input
    Search Contact    ${CHAT_SESSION.TO}
    Wait Until Results Showed
    Click On First Result
    Click On Done Button
    Wait Until Private Chat Page Showed
    Enter Chat Message    ${CHAT_SESSION.MESSAGE}
    Click Send Message
    Click Back Button In Private Chat Page
    Wait Until Messages Showed
    Latest Message Content Should Be    ${CHAT_SESSION.MESSAGE}