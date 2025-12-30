*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${AB_TESTING_LINK}           css:a[href='/abtest']
${ADD_REMOVE_ELEMENTS_LINK}  css:a[href='/add_remove_elements/']
${BASIC_AUTH_LINK}           css:a[href='/basic_auth']
${CHECKBOXES_LINK}           css:a[href='/checkboxes']
${DROPDOWN_LINK}             css:a[href='/dropdown']

*** Keywords ***
Navigate To Home Page
    Go To    ${BASE_URL}

Click AB Testing Link
    Click Element    ${AB_TESTING_LINK}

Click Add Remove Elements Link
    Click Element    ${ADD_REMOVE_ELEMENTS_LINK}

Click Basic Auth Link
    Click Element    ${BASIC_AUTH_LINK}

Click Checkboxes Link
    Click Element    ${CHECKBOXES_LINK}

Click Dropdown Link
    Click Element    ${DROPDOWN_LINK}