*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME_INPUT}    id:username
${PASSWORD_INPUT}    id:password
${LOGIN_BUTTON}      css:[type='submit']
${SUCCESS_MESSAGE}   css:.flash.success
${ERROR_MESSAGE}     css:.flash
${LOGOUT_BUTTON}     css:.button.secondary

*** Keywords ***
Go To Login Page
    Go To    ${BASE_URL}login

Perform Successful Login
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Element    ${LOGIN_BUTTON}

Perform Failed Login
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Element    ${LOGIN_BUTTON}

Welcome Message Should Be Visible
    Wait Until Element Is Visible    ${SUCCESS_MESSAGE}
    Element Should Contain    ${SUCCESS_MESSAGE}    You logged into a secure area!

Error Message Should Contain
    [Arguments]    ${expected_message}
    Wait Until Element Is Visible    ${ERROR_MESSAGE}
    Element Should Contain    ${ERROR_MESSAGE}    ${expected_message}

Logout Should Be Successful
    Click Element    ${LOGOUT_BUTTON}
    Wait Until Element Is Visible    ${SUCCESS_MESSAGE}
    Element Should Contain    ${SUCCESS_MESSAGE}    You logged out of the secure area!