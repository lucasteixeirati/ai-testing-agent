*** Settings ***
Resource    ../resources/common/common_setup.resource
Resource    ../resources/pages/InputsPage.resource

Suite Setup     Setup Test Environment
Suite Teardown  Teardown Test Environment

*** Test Cases ***
Input Valid Number
    [Tags]    Inputs    Forms
    Navigate To Inputs Page
    Input Number    123
    Input Field Should Contain    123

Clear Input Field
    [Tags]    Inputs    Forms
    Navigate To Inputs Page
    Input Number    456
    Clear Input Field
    Input Field Should Contain    ${EMPTY}