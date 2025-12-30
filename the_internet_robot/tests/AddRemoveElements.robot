*** Settings ***
Resource    ../resources/common/common_setup.resource
Resource    ../resources/pages/AddRemoveElementsPage.resource

Suite Setup     Setup Test Environment
Suite Teardown  Teardown Test Environment

*** Test Cases ***
Add Element Successfully
    [Tags]    AddRemove    Elements
    Navigate To Add Remove Elements Page
    Click Add Element Button
    Delete Button Should Be Visible

Remove Element Successfully
    [Tags]    AddRemove    Elements
    Navigate To Add Remove Elements Page
    Click Add Element Button
    Delete Button Should Be Visible
    Click Delete Button
    Delete Button Should Not Be Visible