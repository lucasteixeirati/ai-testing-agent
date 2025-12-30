*** Settings ***
Library    SeleniumLibrary
Library    ../../config/locators.py

*** Keywords ***
Navigate To Hovers Page
    Go To    ${BASE_URL}hovers

Hover Over First Figure
    Mouse Over    ${HoversPageLocators.FIGURE_1}

Hover Over Second Figure
    Mouse Over    ${HoversPageLocators.FIGURE_2}

Hover Over Third Figure
    Mouse Over    ${HoversPageLocators.FIGURE_3}

Caption Should Be Visible
    Wait Until Element Is Visible    ${HoversPageLocators.CAPTION}