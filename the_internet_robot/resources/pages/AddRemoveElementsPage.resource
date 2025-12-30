*** Settings ***
Library    SeleniumLibrary
Library    ../../config/locators.py

*** Keywords ***
Navigate To Add Remove Elements Page
    Go To    ${BASE_URL}add_remove_elements/

Click Add Element Button
    Click Element    ${AddRemoveElementsPageLocators.ADD_ELEMENT_BUTTON}

Delete Button Should Be Visible
    Element Should Be Visible    ${AddRemoveElementsPageLocators.DELETE_BUTTON}

Click Delete Button
    Click Element    ${AddRemoveElementsPageLocators.DELETE_BUTTON}

Delete Button Should Not Be Visible
    Element Should Not Be Visible    ${AddRemoveElementsPageLocators.DELETE_BUTTON}