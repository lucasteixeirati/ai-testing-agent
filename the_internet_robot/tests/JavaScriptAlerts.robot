*** Settings ***
Resource    ../resources/common/common_setup.resource
Resource    ../resources/pages/JavaScriptAlertsPage.resource

Suite Setup     Setup Test Environment
Suite Teardown  Teardown Test Environment

*** Test Cases ***
Handle JavaScript Alert
    [Tags]    JavaScript    Alerts
    Navigate To JavaScript Alerts Page
    Click JS Alert Button
    Handle Alert And Verify Message    I am a JS Alert
    Result Should Contain    You successfully clicked an alert

Handle JavaScript Confirm Accept
    [Tags]    JavaScript    Alerts
    Navigate To JavaScript Alerts Page
    Click JS Confirm Button
    Handle Confirm And Accept
    Result Should Contain    You clicked: Ok

Handle JavaScript Confirm Dismiss
    [Tags]    JavaScript    Alerts
    Navigate To JavaScript Alerts Page
    Click JS Confirm Button
    Handle Confirm And Dismiss
    Result Should Contain    You clicked: Cancel

Handle JavaScript Prompt
    [Tags]    JavaScript    Alerts
    Navigate To JavaScript Alerts Page
    Click JS Prompt Button
    Input Text Into Alert    Robot Framework Test
    Handle Alert    ACCEPT
    Result Should Contain    You entered: Robot Framework Test