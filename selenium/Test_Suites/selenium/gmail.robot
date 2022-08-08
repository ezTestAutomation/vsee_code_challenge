*** Settings ***
Resource          ${EXECDIR}/resources/selenium/gmail_keyword.robot
Library           ${EXECDIR}/lib/selenium/GmailPage.py
Suite Setup       Navigate To Home Page
Suite Teardown    Close All Browsers

*** Test Cases ***
Test Login To Gmail Account And Send An Email Then Verify The Sent Mail
    # Login To Gmail Account
    Wait Until It Navigate To Email Input Page
    Enter Email Address  ${GMAIL_ACCOUNT.EMAIL}
    Click Next On Email Input Page
    Wait Until It Navigate To Password Input Page
    Enter Password  ${GMAIL_ACCOUNT.PASSWORD}
    Click Next On Password Input Page
    ${pin}=    Get TOTP    ${GMAIL_ACCOUNT.GPG_KEY}
    Enter TOTP Pin And Login  ${pin}
    Wait Until It Navigate To Gmail Page
    Click On Compose Mail Button
    Wait Until Compose Mail Box Visible
    # Sent An Email
    ${timestamp}=    Get Current Time In Miliseconds
    ${subject}=    Set Variable    ${COMPOSE_MAIL.SUBJECT} - ${timestamp}
    Enter To Email  ${COMPOSE_MAIL.TO}
    Enter Subject  ${subject}
    Enter Mail Content  ${COMPOSE_MAIL.CONTENT}
    Click Send Button
    Wait Until Compose Mail Box Is Not Visible
    # Verify Sent Mail
    ${sent_mail}=    Get Latest Sent Mail Info    ${GMAIL_ACCOUNT.EMAIL}    ${GMAIL_ACCOUNT.APP_PASSWORD}
    Should Contain    ${sent_mail["FROM"]}    ${GMAIL_ACCOUNT.EMAIL}
    Should Contain    ${sent_mail["TO"]}    ${COMPOSE_MAIL.TO}
    Should Be Equal    ${sent_mail["SUBJECT"]}    ${subject}
