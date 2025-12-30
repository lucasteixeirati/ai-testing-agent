*** Settings ***
Library    SeleniumLibrary
Library    ../../config/locators.py

*** Keywords ***
Navigate To Dropdown Page
    Go To    ${BASE_URL}dropdown

Select Option 1
    Select From List By Value    ${DropdownPageLocators.DROPDOWN}    1

Select Option 2
    Select From List By Value    ${DropdownPageLocators.DROPDOWN}    2

Option 1 Should Be Selected
    List Selection Should Be    ${DropdownPageLocators.DROPDOWN}    Option 1

Option 2 Should Be Selected
    List Selection Should Be    ${DropdownPageLocators.DROPDOWN}    Option 2