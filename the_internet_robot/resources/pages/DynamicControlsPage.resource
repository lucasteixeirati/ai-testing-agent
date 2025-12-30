*** Settings ***
Library    SeleniumLibrary
Library    ../../config/locators.py

*** Keywords ***
Navigate To Dynamic Controls Page
    Go To    ${BASE_URL}dynamic_controls

Input Field Should Be Disabled
    Element Should Be Disabled    ${DynamicControlsPageLocators.INPUT_TEXT_FIELD}

Click Enable Button And Wait
    Click Element    ${DynamicControlsPageLocators.BUTTON_ENABLE_DISABLE}
    Wait Until Element Is Visible    ${DynamicControlsPageLocators.LOADING_BAR}
    Wait Until Element Is Not Visible    ${DynamicControlsPageLocators.LOADING_BAR}
    
Input Field Should Be Enabled
    Element Should Be Enabled    ${DynamicControlsPageLocators.INPUT_TEXT_FIELD}

Checkbox Should Be Visible
    Element Should Be Visible    ${DynamicControlsPageLocators.CHECKBOX}

Click Remove Button And Wait
    Click Element    ${DynamicControlsPageLocators.CHECKBOX_BUTTON}
    Wait Until Element Is Visible    ${DynamicControlsPageLocators.LOADING_BAR}
    Wait Until Element Is Not Visible    ${DynamicControlsPageLocators.LOADING_BAR}

Checkbox Should Not Be Visible
    Element Should Not Be Visible    ${DynamicControlsPageLocators.CHECKBOX}