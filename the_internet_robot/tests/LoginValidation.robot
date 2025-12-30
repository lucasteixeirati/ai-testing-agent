*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common/common_setup.resource
Resource    ../resources/pages/LoginPage.resource

Suite Setup     Setup Test Environment
Suite Teardown  Teardown Test Environment

*** Test Cases ***


Invalid Username Should Fail
    [Tags]    Regression    Login    Invalid
    [Documentation]    Testa login com username inválido
    Go To Login Page
    Perform Failed Login    invaliduser    SuperSecretPassword!
    Error Message Should Contain    Your username is invalid!

Invalid Password Should Fail
    [Tags]    Regression    Login    Invalid
    [Documentation]    Testa login com password inválido
    Go To Login Page
    Perform Failed Login    tomsmith    wrongpassword
    Error Message Should Contain    Your password is invalid!

Empty Credentials Should Fail
    [Tags]    Regression    Login    Invalid
    [Documentation]    Testa login com credenciais vazias
    Go To Login Page
    Perform Failed Login    ${EMPTY}    ${EMPTY}
    Error Message Should Contain    Your username is invalid!

Both Invalid Credentials Should Fail
    [Tags]    Regression    Login    Invalid
    [Documentation]    Testa login com ambas credenciais inválidas
    Go To Login Page
    Perform Failed Login    wronguser    wrongpass
    Error Message Should Contain    Your username is invalid!