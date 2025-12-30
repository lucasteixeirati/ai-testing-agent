*** Settings ***
Resource    ../resources/common/common_setup.resource
Resource    ../resources/pages/KeyPressesPage.resource

Suite Setup     Setup Test Environment
Suite Teardown  Teardown Test Environment

*** Test Cases ***
Press Enter Key
    [Tags]    KeyPresses    Interaction
    Navigate To Key Presses Page
    Click Input Field
    Press Key    RETURN
    Result Should Show Key    ENTER

Press Space Key
    [Tags]    KeyPresses    Interaction
    Navigate To Key Presses Page
    Click Input Field
    Press Key    SPACE
    Result Should Show Key    SPACE

Press Tab Key
    [Tags]    KeyPresses    Interaction
    Navigate To Key Presses Page
    Click Input Field
    Press Key    TAB
    Result Should Show Key    TAB