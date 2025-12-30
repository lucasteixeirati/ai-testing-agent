*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${JS_ALERT_BUTTON}     css:button[onclick='jsAlert()']
${JS_CONFIRM_BUTTON}   css:button[onclick='jsConfirm()']
${JS_PROMPT_BUTTON}    css:button[onclick='jsPrompt()']
${RESULT_TEXT}         id:result

*** Keywords ***
Navigate To JavaScript Alerts Page
    Go To    ${BASE_URL}javascript_alerts

Click JS Alert Button
    Click Element    ${JS_ALERT_BUTTON}

Click JS Confirm Button
    Click Element    ${JS_CONFIRM_BUTTON}

Click JS Prompt Button
    Click Element    ${JS_PROMPT_BUTTON}

Handle Alert And Verify Message
    [Arguments]    ${expected_message}
    ${alert_text}=    Handle Alert    ACCEPT
    Should Be Equal    ${alert_text}    ${expected_message}

Handle Confirm And Accept
    Handle Alert    ACCEPT

Handle Confirm And Dismiss
    Handle Alert    DISMISS

Handle Prompt With Text
    [Arguments]    ${text}
    Input Text Into Alert    ${text}
    Handle Alert    ACCEPT

Result Should Contain
    [Arguments]    ${expected_text}
    Wait Until Element Is Visible    ${RESULT_TEXT}
    Element Should Contain    ${RESULT_TEXT}    ${expected_text}