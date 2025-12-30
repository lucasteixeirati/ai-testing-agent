*** Settings ***
Resource    ../resources/common/common_setup.resource
Resource    ../resources/pages/DropdownPage.resource

Suite Setup     Setup Test Environment
Suite Teardown  Teardown Test Environment

*** Test Cases ***
Select Dropdown Option 1
    [Tags]    Dropdown    Forms
    Navigate To Dropdown Page
    Select Option 1
    Option 1 Should Be Selected

Select Dropdown Option 2
    [Tags]    Dropdown    Forms
    Navigate To Dropdown Page
    Select Option 2
    Option 2 Should Be Selected