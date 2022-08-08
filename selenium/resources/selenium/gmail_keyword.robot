*** Settings ***
Resource    ${EXECDIR}/resources/selenium/common.robot

*** Keywords ***
Wait Until It Navigate To Email Input Page
    Wait Until Element Is Visible    ${LOGIN_PAGE.EMAIL_INPUT}    timeout=${Timeout}

Enter Email Address
    [Arguments]    ${email}
    Input Text    ${LOGIN_PAGE.EMAIL_INPUT}    ${email}

Click Next On Email Input Page
    Click Element    ${LOGIN_PAGE.EMAIL_NEXT_BUTTON}

Wait Until It Navigate To Password Input Page
    Wait Until Element Is Visible    ${LOGIN_PAGE.PASSWORD_INPUT}    timeout=${Timeout}

Enter Password
    [Arguments]    ${password}
    Input Text    ${LOGIN_PAGE.PASSWORD_INPUT}    ${password}

Click Next On Password Input Page
    Click Element    ${LOGIN_PAGE.PASSWORD_NEXT_BUTTON}

Wait Until It Navigate To TOTP Pin Input
    Wait Until Page Contains Element    ${LOGIN_PAGE.TOTP_PIN_INPUT}    timeout=10s

Enter TOTP Pin And Login
    [Arguments]    ${pin}
    Disable Capture Page Screenshot On Failure
    ${status}=    Run Keyword And Return Status    Wait Until It Navigate To TOTP Pin Input
    Enable Capture Page Screenshot On Failure
    IF    ${status} == ${True}
        Wait Until Element Is Visible    ${LOGIN_PAGE.TOTP_PIN_INPUT}    timeout=10s
        Input Text    ${LOGIN_PAGE.TOTP_PIN_INPUT}    ${pin}
        Click Element    ${LOGIN_PAGE.TOTP_NEXT_BUTTON}
    END

Wait Until It Navigate To Gmail Page
     Wait Until Page Contains Element    ${GMAIL_PAGE.COMPOSE_BUTTON}    timeout=${Timeout}

Click On Compose Mail Button
    Click Element    ${GMAIL_PAGE.COMPOSE_BUTTON}

Wait Until Compose Mail Box Visible
    Wait Until Element Is Visible    ${GMAIL_PAGE.TO_INPUT}    timeout=${Timeout}

Enter To Email
    [Arguments]    ${email}
    Input Text     ${GMAIL_PAGE.TO_INPUT}    ${email}

Enter Subject
    [Arguments]    ${subject}
    Input Text    ${GMAIL_PAGE.SUBJECT_INPUT}    ${subject}

Enter Mail Content
    [Arguments]    ${content}
    Click Element    ${GMAIL_PAGE.BODY_INPUT}
    Press Keys    ${GMAIL_PAGE.BODY_INPUT}    ${content}

Click Send Button
    Click Element    ${GMAIL_PAGE.SEND_BUTTON}
    Sleep    3s

Wait Until Compose Mail Box Is Not Visible
    Wait Until Element Is Not Visible    ${GMAIL_PAGE.TO_INPUT}    timeout=${Timeout}
