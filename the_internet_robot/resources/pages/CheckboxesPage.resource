*** Settings ***
Library    SeleniumLibrary
Library    ../../config/locators.py

*** Keywords ***
Navigate To Checkboxes Page
    Go To    ${BASE_URL}checkboxes

Check First Checkbox
    Select Checkbox    ${CheckboxesPageLocators.CHECKBOX_1}

Uncheck First Checkbox
    Unselect Checkbox    ${CheckboxesPageLocators.CHECKBOX_1}

Check Second Checkbox
    Select Checkbox    ${CheckboxesPageLocators.CHECKBOX_2}

Uncheck Second Checkbox
    Unselect Checkbox    ${CheckboxesPageLocators.CHECKBOX_2}

First Checkbox Should Be Selected
    Checkbox Should Be Selected    ${CheckboxesPageLocators.CHECKBOX_1}

First Checkbox Should Not Be Selected
    Checkbox Should Not Be Selected    ${CheckboxesPageLocators.CHECKBOX_1}

Second Checkbox Should Be Selected
    Checkbox Should Be Selected    ${CheckboxesPageLocators.CHECKBOX_2}

Second Checkbox Should Not Be Selected
    Checkbox Should Not Be Selected    ${CheckboxesPageLocators.CHECKBOX_2}