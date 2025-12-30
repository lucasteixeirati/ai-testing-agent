*** Settings ***
Resource    ../resources/common/common_setup.resource
Resource    ../resources/pages/DynamicControlsPage.resource

Suite Setup     Setup Test Environment
Suite Teardown  Teardown Test Environment

*** Test Cases ***
Enable Disable Input Field
    [Tags]    Dynamic    Controls
    Navigate To Dynamic Controls Page
    Input Field Should Be Disabled
    Click Enable Button And Wait
    Input Field Should Be Enabled

Remove Add Checkbox
    [Tags]    Dynamic    Controls
    Navigate To Dynamic Controls Page
    Checkbox Should Be Visible
    Click Remove Button And Wait
    Checkbox Should Not Be Visible