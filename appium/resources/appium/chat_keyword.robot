*** Settings ***
Resource    ${EXECDIR}/resources/appium/common.robot


*** Keywords ***
Wait Until Login Page Showed
    Wait Until Element Is Visible    ${VSEE_LOGIN_PAGE.EMAIL_INPUT}    timeout=${GLOBAL_TIMEOUT}

Enter Email Address
    [Arguments]    ${email}
    Input Text    ${VSEE_LOGIN_PAGE.EMAIL_INPUT}    ${email}

Enter Password
    [Arguments]    ${password}
    Input Password    ${VSEE_LOGIN_PAGE.PASSWORD_INPUT}    ${password}

Click Sign In Button
    Click Element    ${VSEE_LOGIN_PAGE.SIGN_IN_BUTTON}

Wait Until Login Successfully
    Wait Until Element Is Visible    ${MAIN_PAGE.FOOTER_MENU.CHATS}    timeout=${GLOBAL_TIMEOUT}

Click On Chat Menu Item
    Click Element    ${MAIN_PAGE.FOOTER_MENU.CHATS}

Wait Until It Navigate To Chat Page
    Wait Until Element Is Visible    ${CHAT_HOMEPAGE.NEW_CHAT_BUTTON}    timeout=${GLOBAL_TIMEOUT}

Click On New Chat Button
    Click Element    ${CHAT_HOMEPAGE.NEW_CHAT_BUTTON}

Wait Until Search Contact Page Showed
    Wait Until Element Is Visible    ${SEARCH_CONTACT_PAGE.SEARCH_INPUT}    timeout=${GLOBAL_TIMEOUT}
    Sleep    2s

Search Contact
    [Arguments]    ${contact_email}
    Input Text    ${SEARCH_CONTACT_PAGE.SEARCH_INPUT}    ${contact_email}

Click On Search Contact Input
    Click Element    ${SEARCH_CONTACT_PAGE.SEARCH_INPUT}

Wait Until Results Showed
    Wait Until Element Is Visible    ${SEARCH_CONTACT_PAGE.FIRST_RESULT}    timeout=${GLOBAL_TIMEOUT}

Click On First Result
    ${elements}=    Get Webelements    ${SEARCH_CONTACT_PAGE.FIRST_RESULT}
    Click Element    ${elements}[${0}]
    ${elements}=    Get Webelements    ${SEARCH_CONTACT_PAGE.CONTACT_EMAILS}
    Click Element    ${elements}[${0}]

Wait Until Search Result Is Not Visible
    Wait Until Page Does Not Contain Element    ${SEARCH_CONTACT_PAGE.FIRST_RESULT}    timeout=${GLOBAL_TIMEOUT}

Wait Until Done Button Visible
    Wait Until Element Is Visible    ${SEARCH_CONTACT_PAGE.DONE_BUTTON}    timeout=${GLOBAL_TIMEOUT}

Click On Done Button
    Click Element    ${SEARCH_CONTACT_PAGE.DONE_BUTTON}

Wait Until Private Chat Page Showed
    Wait Until Element Is Visible    ${PRIVATE_CHAT_PAGE.MESSAGE_INPUT}    timeout=${GLOBAL_TIMEOUT}

Enter Chat Message
    [Arguments]    ${message}
    Input Text    ${PRIVATE_CHAT_PAGE.MESSAGE_INPUT}    ${message}

Click Send Message
    Click Element    ${PRIVATE_CHAT_PAGE.SEND_BUTTON}
    Sleep    500ms

Click Back Button In Private Chat Page
    Click Element    ${PRIVATE_CHAT_PAGE.BACK_BUTTON}

Wait Until Messages Showed
    Wait Until Element Is Visible    ${CHAT_HOMEPAGE.MESSAGE_CONTENTS}    timeout=${GLOBAL_TIMEOUT}

Latest Message Content Should Be
    [Arguments]    ${expected}
    ${elements}=    Get Webelements    ${CHAT_HOMEPAGE.MESSAGE_CONTENTS}
    Element Text Should Be    ${elements}[${0}]    ${expected}

