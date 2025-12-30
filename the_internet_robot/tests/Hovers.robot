*** Settings ***
Resource    ../resources/common/common_setup.resource
Resource    ../resources/pages/HoversPage.resource

Suite Setup     Setup Test Environment
Suite Teardown  Teardown Test Environment

*** Test Cases ***
Hover Over First Figure Shows Caption
    [Tags]    Hovers    Interaction
    Navigate To Hovers Page
    Hover Over First Figure
    Caption Should Be Visible

Hover Over Second Figure Shows Caption
    [Tags]    Hovers    Interaction
    Navigate To Hovers Page
    Hover Over Second Figure
    Caption Should Be Visible

Hover Over Third Figure Shows Caption
    [Tags]    Hovers    Interaction
    Navigate To Hovers Page
    Hover Over Third Figure
    Caption Should Be Visible