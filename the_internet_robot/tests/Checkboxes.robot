*** Settings ***
Resource    ../resources/common/common_setup.resource
Resource    ../resources/pages/CheckboxesPage.resource

Suite Setup     Setup Test Environment
Suite Teardown  Teardown Test Environment

*** Test Cases ***
Check And Uncheck First Checkbox
    [Tags]    Checkboxes    Forms
    Navigate To Checkboxes Page
    Check First Checkbox
    First Checkbox Should Be Selected
    Uncheck First Checkbox
    First Checkbox Should Not Be Selected

Check And Uncheck Second Checkbox
    [Tags]    Checkboxes    Forms
    Navigate To Checkboxes Page
    Check Second Checkbox
    Second Checkbox Should Be Selected
    Uncheck Second Checkbox
    Second Checkbox Should Not Be Selected