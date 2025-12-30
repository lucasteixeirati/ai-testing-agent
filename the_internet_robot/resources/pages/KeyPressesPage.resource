*** Settings ***
Library    SeleniumLibrary
Library    ../../config/locators.py

*** Keywords ***
Navigate To Key Presses Page
    Go To    ${BASE_URL}key_presses

Click Input Field
    Click Element    ${KeyPressesPageLocators.INPUT_FIELD}

Press Key
    [Arguments]    ${key}
    Press Keys    ${KeyPressesPageLocators.INPUT_FIELD}    ${key}

Result Should Show Key
    [Arguments]    ${expected_key}
    Element Should Contain    ${KeyPressesPageLocators.RESULT}    ${expected_key}