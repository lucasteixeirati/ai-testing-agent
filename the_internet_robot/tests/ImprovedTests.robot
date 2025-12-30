*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    ../libraries/CustomKeywords.py
Resource    ../resources/common/common_setup.resource
Resource    ../resources/pages/LoginPage.resource
Resource    ../resources/pages/JavaScriptAlertsPage.resource
Resource    ../resources/pages/HomePage.resource

Suite Setup     Setup Test Environment Enhanced
Suite Teardown  Teardown Test Environment Enhanced
Test Setup      Test Setup Enhanced
Test Teardown   Test Teardown Enhanced

*** Variables ***
${CONFIG_FILE}    ${CURDIR}/../config/test_config.yaml

*** Keywords ***
Setup Test Environment Enhanced
    ${env_url}=    Get Environment URL    prod
    Set Global Variable    ${BASE_URL}    ${env_url}
    ${timeout}=    Get Timeout    default
    Set Global Variable    ${DEFAULT_TIMEOUT}    ${timeout}
    
    Run Keyword If    '${HEADLESS_MODE}' == 'True'    Open Headless Chrome Browser
    ...    ELSE    Open Browser    about:blank    ${BROWSER}
    Maximize Browser Window

Teardown Test Environment Enhanced
    Close All Browsers

Test Setup Enhanced
    Log    Starting test: ${TEST_NAME}

Test Teardown Enhanced
    Run Keyword If Test Failed    Take Screenshot On Failure
    Log    Finished test: ${TEST_NAME}

*** Test Cases ***
# Data-Driven Login Tests


Login Test With Invalid Credentials
    [Template]    Test Login Scenario
    [Tags]    Regression    Login    DataDriven
    invaliduser    wrongpass    Your username is invalid
    tomsmith    wrongpass    Your password is invalid
    ${EMPTY}    ${EMPTY}    Your username is invalid

# Enhanced JavaScript Tests
Enhanced JavaScript Alert Test
    [Tags]    JavaScript    Enhanced
    Navigate To JavaScript Alerts Page
    Smart Click Element    ${JS_ALERT_BUTTON}
    Handle Alert And Verify Message    I am a JS Alert
    Smart Wait For Element Visible    ${RESULT_TEXT}
    Element Should Contain    ${RESULT_TEXT}    You successfully clicked an alert

Enhanced JavaScript Confirm Accept Test
    [Tags]    JavaScript    Enhanced
    Navigate To JavaScript Alerts Page
    Smart Click Element    ${JS_CONFIRM_BUTTON}
    Handle Confirm And Accept
    Smart Wait For Element Visible    ${RESULT_TEXT}
    Element Should Contain    ${RESULT_TEXT}    You clicked: Ok

# Multi-Browser Navigation Tests
Enhanced Navigation Test AB Testing
    [Tags]    Navigation    Enhanced
    Navigate To Home Page
    Smart Click Element    ${AB_TESTING_LINK}
    Smart Wait For Element Visible    css:h3
    Location Should Contain    /abtest

Enhanced Navigation Test Checkboxes
    [Tags]    Navigation    Enhanced
    Navigate To Home Page
    Smart Click Element    ${CHECKBOXES_LINK}
    Smart Wait For Element Visible    css:form
    Location Should Contain    /checkboxes

# Enhanced Form Tests
Enhanced Checkbox Test First
    [Tags]    Forms    Enhanced
    Go To    ${BASE_URL}checkboxes
    ${checkbox1}=    Set Variable    css:form input[type='checkbox']:nth-of-type(1)
    Smart Wait For Element Visible    ${checkbox1}
    Select Checkbox    ${checkbox1}
    Checkbox Should Be Selected    ${checkbox1}
    Unselect Checkbox    ${checkbox1}
    Checkbox Should Not Be Selected    ${checkbox1}

Enhanced Checkbox Test Second
    [Tags]    Forms    Enhanced
    Go To    ${BASE_URL}checkboxes
    ${checkbox2}=    Set Variable    css:form input[type='checkbox']:nth-of-type(2)
    Smart Wait For Element Visible    ${checkbox2}
    Select Checkbox    ${checkbox2}
    Checkbox Should Be Selected    ${checkbox2}
    Unselect Checkbox    ${checkbox2}
    Checkbox Should Not Be Selected    ${checkbox2}

# Enhanced Dropdown Tests
Enhanced Dropdown Test Option 1
    [Tags]    Forms    Enhanced
    Go To    ${BASE_URL}dropdown
    ${dropdown}=    Set Variable    id:dropdown
    Smart Wait For Element Visible    ${dropdown}
    Select From List By Value    ${dropdown}    1
    List Selection Should Be    ${dropdown}    Option 1

Enhanced Dropdown Test Option 2
    [Tags]    Forms    Enhanced
    Go To    ${BASE_URL}dropdown
    ${dropdown}=    Set Variable    id:dropdown
    Smart Wait For Element Visible    ${dropdown}
    Select From List By Value    ${dropdown}    2
    List Selection Should Be    ${dropdown}    Option 2

# Enhanced Hover Tests
Enhanced Hover Test Figure 1
    [Tags]    Interaction    Enhanced
    Go To    ${BASE_URL}hovers
    ${figure1}=    Set Variable    css:.figure:nth-of-type(1)
    ${caption1}=    Set Variable    css:.figure:nth-of-type(1) .figcaption
    Smart Wait For Hover Effect    ${figure1}    ${caption1}
    Element Should Be Visible    ${caption1}
    Element Should Contain    ${caption1}    name: user1

Enhanced Hover Test Figure 2
    [Tags]    Interaction    Enhanced
    Go To    ${BASE_URL}hovers
    ${figure2}=    Set Variable    css:.figure:nth-of-type(2)
    ${caption2}=    Set Variable    css:.figure:nth-of-type(2) .figcaption
    Smart Wait For Hover Effect    ${figure2}    ${caption2}
    Element Should Be Visible    ${caption2}
    Element Should Contain    ${caption2}    name: user2

# Enhanced Input Tests
Enhanced Input Number Test
    [Tags]    Forms    Enhanced
    Go To    ${BASE_URL}inputs
    ${number_input}=    Set Variable    css:input[type='number']
    Smart Input Text    ${number_input}    123
    Textfield Value Should Be    ${number_input}    123

Enhanced Input Clear Test
    [Tags]    Forms    Enhanced
    Go To    ${BASE_URL}inputs
    ${number_input}=    Set Variable    css:input[type='number']
    Smart Input Text    ${number_input}    456
    Clear Element Text    ${number_input}
    Textfield Value Should Be    ${number_input}    ${EMPTY}

# Enhanced Key Press Tests
Enhanced Key Press Space Test
    [Tags]    Interaction    Enhanced
    Go To    ${BASE_URL}key_presses
    ${input_field}=    Set Variable    id:target
    ${result}=    Set Variable    id:result
    Smart Click Element    ${input_field}
    Press Keys    ${input_field}    SPACE
    Smart Wait For Element Visible    ${result}
    Element Should Contain    ${result}    SPACE

*** Keywords ***
Test Login Scenario
    [Arguments]    ${username}    ${password}    ${expected_error}
    Go To Login Page
    Smart Input Text    ${USERNAME_INPUT}    ${username}
    Smart Input Text    ${PASSWORD_INPUT}    ${password}
    Smart Click Element    ${LOGIN_BUTTON}
    Smart Wait For Element Visible    css:.flash
    Page Should Contain    ${expected_error}