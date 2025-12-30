*** Settings ***
Library    SeleniumLibrary
Library    ../../config/locators.py

*** Keywords ***
Navigate To Inputs Page
    Go To    ${BASE_URL}inputs

Input Number
    [Arguments]    ${number}
    Input Text    ${InputsPageLocators.NUMBER_INPUT}    ${number}

Clear Input Field
    Clear Element Text    ${InputsPageLocators.NUMBER_INPUT}

Input Field Should Contain
    [Arguments]    ${expected_value}
    Element Should Contain Value    ${InputsPageLocators.NUMBER_INPUT}    ${expected_value}