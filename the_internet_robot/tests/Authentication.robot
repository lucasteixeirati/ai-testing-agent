*** Settings ***
Resource    ../resources/common/common_setup.resource
Resource    ../resources/pages/LoginPage.resource

Suite Setup     Setup Test Environment
Suite Teardown  Teardown Test Environment

*** Test Cases ***
Valid Login Should Succeed
    [Tags]    Smoke    Login
    Go To Login Page
    Perform Successful Login    tomsmith    SuperSecretPassword!
    Welcome Message Should Be Visible
    Logout Should Be Successful

Invalid Login Should Fail
    [Tags]    Regression
    Go To Login Page
    Perform Failed Login    user_invalido    senha_qualquer
    Error Message Should Contain    Your username is invalid!

Empty Credentials Should Fail
    [Tags]    Regression
    Go To Login Page
    Perform Failed Login    ${EMPTY}    ${EMPTY}
    Error Message Should Contain    Your username is invalid!