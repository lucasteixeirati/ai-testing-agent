*** Settings ***
Library    OperatingSystem
Library    SeleniumLibrary
Resource    ../resources/common/common_setup.resource
Resource    ../resources/pages/LoginPage.resource
Resource    ../resources/pages/JavaScriptAlertsPage.resource
Resource    ../resources/pages/HomePage.resource

Suite Setup     Setup Test Environment
Suite Teardown  Teardown Test Environment

*** Variables ***
# Dynamic Controls
${INPUT_TEXT_FIELD}      css:#input-example input[type='text']
${BUTTON_ENABLE_DISABLE}    css:#input-example button
${LOADING_BAR}           id:loading
${CHECKBOX}              css:#checkbox-example input[type='checkbox']
${CHECKBOX_BUTTON}       css:#checkbox-example button

# File Upload
${FILE_INPUT}            id:file-upload
${UPLOAD_BUTTON}         id:file-submit
${UPLOADED_FILES}        id:uploaded-files

# Add/Remove Elements
${ADD_ELEMENT_BUTTON}    css:button[onclick='addElement()']
${DELETE_BUTTON}         css:.added-manually

# Checkboxes
${CHECKBOX_1}            css:form input[type='checkbox']:nth-of-type(1)
${CHECKBOX_2}            css:form input[type='checkbox']:nth-of-type(2)

# Dropdown
${DROPDOWN}              id:dropdown

# Hovers
${FIGURE_1}              css:.figure:nth-of-type(1)
${FIGURE_2}              css:.figure:nth-of-type(2)
${FIGURE_3}              css:.figure:nth-of-type(3)
${CAPTION}               css:.figcaption h5

# Inputs
${NUMBER_INPUT}          css:input[type='number']

# Key Presses
${INPUT_FIELD}           id:target
${RESULT}                id:result



*** Test Cases ***
# Authentication Tests
Invalid Login Should Fail
    [Tags]    Regression
    Go To Login Page
    Input Text    ${USERNAME_INPUT}    invaliduser
    Input Text    ${PASSWORD_INPUT}    wrongpassword
    Click Element    ${LOGIN_BUTTON}
    Sleep    3s
    Page Should Contain    Your username is invalid!
    Sleep    1s

# JavaScript Alerts Tests
Handle JavaScript Alert
    [Tags]    JavaScript    Alerts
    Navigate To JavaScript Alerts Page
    Click JS Alert Button
    Sleep    1s
    Handle Alert And Verify Message    I am a JS Alert
    Result Should Contain    You successfully clicked an alert
    Sleep    1s

Handle JavaScript Confirm Accept
    [Tags]    JavaScript    Alerts
    Navigate To JavaScript Alerts Page
    Click JS Confirm Button
    Sleep    1s
    Handle Confirm And Accept
    Result Should Contain    You clicked: Ok
    Sleep    1s

Handle JavaScript Confirm Dismiss
    [Tags]    JavaScript    Alerts
    Navigate To JavaScript Alerts Page
    Click JS Confirm Button
    Sleep    1s
    Handle Confirm And Dismiss
    Result Should Contain    You clicked: Cancel
    Sleep    1s

# Dynamic Controls Tests
Enable Disable Input Field
    [Tags]    Dynamic    Controls
    Go To    ${BASE_URL}dynamic_controls
    Wait Until Element Is Visible    ${INPUT_TEXT_FIELD}    timeout=10s
    Element Should Be Disabled    ${INPUT_TEXT_FIELD}
    Click Element    ${BUTTON_ENABLE_DISABLE}
    Sleep    5s
    Element Should Be Enabled    ${INPUT_TEXT_FIELD}
    Sleep    1s

Remove Add Checkbox
    [Tags]    Dynamic    Controls
    Go To    ${BASE_URL}dynamic_controls
    Wait Until Element Is Visible    ${CHECKBOX}    timeout=10s
    Element Should Be Visible    ${CHECKBOX}
    Click Element    ${CHECKBOX_BUTTON}
    Sleep    5s
    Element Should Not Be Visible    ${CHECKBOX}
    Sleep    1s

# File Upload Test
Upload File Successfully
    [Tags]    FileUpload
    Go To    ${BASE_URL}upload
    ${test_file}=    Set Variable    ${CURDIR}${/}test_file.txt
    Create File    ${test_file}    Conteúdo do arquivo de teste
    Choose File    ${FILE_INPUT}    ${test_file}
    Click Element    ${UPLOAD_BUTTON}
    Sleep    3s
    Page Should Contain    File Uploaded
    Remove File    ${test_file}
    Sleep    1s
# Add/Remove Elements Tests
Add Element Successfully
    [Tags]    AddRemove    Elements
    Go To    ${BASE_URL}add_remove_elements/
    Click Element    ${ADD_ELEMENT_BUTTON}
    Wait Until Element Is Visible    ${DELETE_BUTTON}

Remove Element Successfully
    [Tags]    AddRemove    Elements
    Go To    ${BASE_URL}add_remove_elements/
    Click Element    ${ADD_ELEMENT_BUTTON}
    Wait Until Element Is Visible    ${DELETE_BUTTON}
    Click Element    ${DELETE_BUTTON}
    Wait Until Element Is Not Visible    ${DELETE_BUTTON}

# Checkboxes Tests
Check And Uncheck First Checkbox
    [Tags]    Checkboxes    Forms
    Go To    ${BASE_URL}checkboxes
    Select Checkbox    ${CHECKBOX_1}
    Checkbox Should Be Selected    ${CHECKBOX_1}
    Unselect Checkbox    ${CHECKBOX_1}
    Checkbox Should Not Be Selected    ${CHECKBOX_1}

Check And Uncheck Second Checkbox
    [Tags]    Checkboxes    Forms
    Go To    ${BASE_URL}checkboxes
    Select Checkbox    ${CHECKBOX_2}
    Checkbox Should Be Selected    ${CHECKBOX_2}
    Unselect Checkbox    ${CHECKBOX_2}
    Checkbox Should Not Be Selected    ${CHECKBOX_2}

# Dropdown Tests
Select Dropdown Option 1
    [Tags]    Dropdown    Forms
    Go To    ${BASE_URL}dropdown
    Select From List By Value    ${DROPDOWN}    1
    List Selection Should Be    ${DROPDOWN}    Option 1

Select Dropdown Option 2
    [Tags]    Dropdown    Forms
    Go To    ${BASE_URL}dropdown
    Select From List By Value    ${DROPDOWN}    2
    List Selection Should Be    ${DROPDOWN}    Option 2

# Hovers Tests
Hover Over First Figure Shows Caption
    [Tags]    Hovers    Interaction
    Go To    ${BASE_URL}hovers
    Mouse Over    ${FIGURE_1}
    Wait Until Element Is Visible    ${FIGURE_1} .figcaption

Hover Over Second Figure Shows Caption
    [Tags]    Hovers    Interaction
    Go To    ${BASE_URL}hovers
    Mouse Over    ${FIGURE_2}
    Wait Until Element Is Visible    ${FIGURE_2} .figcaption    timeout=10s

Hover Over Third Figure Shows Caption
    [Tags]    Hovers    Interaction
    Go To    ${BASE_URL}hovers
    Mouse Over    ${FIGURE_3}
    Wait Until Element Is Visible    ${FIGURE_3} .figcaption    timeout=10s

# Inputs Tests
Input Valid Number
    [Tags]    Inputs    Forms
    Go To    ${BASE_URL}inputs
    Input Text    ${NUMBER_INPUT}    123
    Textfield Value Should Be    ${NUMBER_INPUT}    123

Clear Input Field
    [Tags]    Inputs    Forms
    Go To    ${BASE_URL}inputs
    Input Text    ${NUMBER_INPUT}    456
    Clear Element Text    ${NUMBER_INPUT}
    Textfield Value Should Be    ${NUMBER_INPUT}    ${EMPTY}

# Key Presses Tests
Press Enter Key
    [Tags]    KeyPresses    Interaction
    Go To    ${BASE_URL}key_presses
    Click Element    ${INPUT_FIELD}
    Press Keys    ${INPUT_FIELD}    RETURN
    Sleep    2s
    Page Should Contain    You entered
    Sleep    1s

Press Space Key
    [Tags]    KeyPresses    Interaction
    Go To    ${BASE_URL}key_presses
    Click Element    ${INPUT_FIELD}
    Press Keys    ${INPUT_FIELD}    SPACE
    Sleep    2s
    Element Should Contain    ${RESULT}    SPACE
    Sleep    1s

# Navigation Tests (principais)
Navigate To AB Testing Page
    [Tags]    Navigation    Smoke
    Navigate To Home Page
    Click AB Testing Link
    Location Should Contain    /abtest

Navigate To Add Remove Elements Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Add Remove Elements Link
    Location Should Contain    /add_remove_elements

Navigate To Checkboxes Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Checkboxes Link
    Location Should Contain    /checkboxes

Navigate To Basic Auth Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Basic Auth Link
    Location Should Contain    /basic_auth

# Novos cenários adicionais
Test Drag And Drop
    [Tags]    DragDrop    Interaction
    Go To    ${BASE_URL}drag_and_drop
    Drag And Drop    id:column-a    id:column-b
    Sleep    2s
    Element Should Contain    id:column-a    B
    Element Should Contain    id:column-b    A
    Sleep    1s

Test Context Menu
    [Tags]    ContextMenu    Interaction
    Go To    ${BASE_URL}context_menu
    Page Should Contain Element    id:hot-spot
    Sleep    1s

Test Multiple Windows
    [Tags]    Windows    Navigation
    Go To    ${BASE_URL}windows
    Click Element    css:a[href='/windows/new']
    Sleep    2s
    Switch Window    NEW
    Page Should Contain    New Window
    Close Window
    Switch Window    MAIN
    Sleep    1s

Test Nested Frames
    [Tags]    Frames    Navigation
    Go To    ${BASE_URL}nested_frames
    Wait Until Element Is Visible    css:frameset    timeout=10s
    Select Frame    xpath://frame[@name='frame-top']
    Select Frame    xpath://frame[@name='frame-left']
    ${text}=    Get Text    css:body
    Should Contain    ${text}    LEFT
    Unselect Frame
    Sleep    1s

Test Horizontal Slider
    [Tags]    Slider    Interaction
    Go To    ${BASE_URL}horizontal_slider
    Drag And Drop By Offset    css:input[type='range']    50    0
    Sleep    2s
    ${value}=    Get Element Attribute    css:input[type='range']    value
    Should Not Be Equal    ${value}    0
    Sleep    1s

Test Sortable Data Tables
    [Tags]    Tables    Data
    Go To    ${BASE_URL}tables
    Wait Until Element Is Visible    css:table#table1    timeout=10s
    Click Element    css:table#table1 th:nth-child(1)
    Sleep    2s
    Page Should Contain Element    css:table#table1
    Sleep    1s

Test Broken Images
    [Tags]    Images    Validation
    Go To    ${BASE_URL}broken_images
    Page Should Contain Element    css:img
    Sleep    1s

Test Challenging DOM
    [Tags]    DOM    Interaction
    Go To    ${BASE_URL}challenging_dom
    Click Element    css:.button
    Sleep    2s
    Page Should Contain Element    css:table
    Sleep    1s

Test Dynamic Content
    [Tags]    Dynamic    Content
    Go To    ${BASE_URL}dynamic_content
    Reload Page
    Sleep    3s
    Page Should Contain Element    css:.large-10
    Sleep    1s

Test Dynamic Loading Hidden Element
    [Tags]    Dynamic    Loading
    Go To    ${BASE_URL}dynamic_loading/1
    Click Element    css:button
    Wait Until Element Is Visible    id:finish    timeout=10s
    Element Should Contain    id:finish    Hello World!
    Sleep    1s

Test Dynamic Loading Rendered Element
    [Tags]    Dynamic    Loading
    Go To    ${BASE_URL}dynamic_loading/2
    Click Element    css:button
    Wait Until Element Is Visible    id:finish    timeout=10s
    Element Should Contain    id:finish    Hello World!
    Sleep    1s

Test Entry Ad Modal
    [Tags]    Modal    Interaction
    Go To    ${BASE_URL}entry_ad
    Sleep    3s
    Run Keyword And Ignore Error    Click Element    css:.modal-footer p
    Sleep    1s

Test Exit Intent
    [Tags]    ExitIntent    Interaction
    Go To    ${BASE_URL}exit_intent
    Execute JavaScript    document.dispatchEvent(new Event('mouseout'))
    Sleep    2s
    Page Should Contain Element    css:body
    Sleep    1s

Test File Download
    [Tags]    Download    Files
    Go To    ${BASE_URL}download
    Page Should Contain Element    css:a[href*='.txt']
    Sleep    1s

Test Floating Menu
    [Tags]    FloatingMenu    Navigation
    Go To    ${BASE_URL}floating_menu
    Execute JavaScript    window.scrollTo(0, 500)
    Sleep    2s
    Element Should Be Visible    id:menu
    Sleep    1s

Test Forgot Password
    [Tags]    ForgotPassword    Forms
    Go To    ${BASE_URL}forgot_password
    Input Text    id:email    test@example.com
    Click Element    id:form_submit
    Sleep    2s
    Page Should Contain    Internal Server Error
    Sleep    1s

Test Geolocation
    [Tags]    Geolocation    Browser
    Go To    ${BASE_URL}geolocation
    Click Element    css:button
    Sleep    3s
    Page Should Contain Element    id:demo
    Sleep    1s

Test Infinite Scroll
    [Tags]    InfiniteScroll    Interaction
    Go To    ${BASE_URL}infinite_scroll
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    3s
    Page Should Contain Element    css:.jscroll-added
    Sleep    1s

Test JQuery UI Menu
    [Tags]    JQueryUI    Menu
    Go To    ${BASE_URL}jqueryui/menu
    Click Element    id:ui-id-3
    Sleep    2s
    Page Should Contain Element    css:.ui-menu
    Sleep    1s

Test JavaScript Error
    [Tags]    JavaScript    Error
    Go To    ${BASE_URL}javascript_error
    Sleep    2s
    Page Should Contain    This page has a JavaScript error
    Sleep    1s

Test Large DOM
    [Tags]    Performance    DOM
    Go To    ${BASE_URL}large
    Wait Until Element Is Visible    css:table    timeout=15s
    Page Should Contain Element    css:table
    Sleep    1s

Test Notification Messages
    [Tags]    Notifications    Messages
    Go To    ${BASE_URL}notification_message
    Click Element    css:a[href='/notification_message']
    Sleep    2s
    Page Should Contain Element    css:.flash
    Sleep    1s

Test Redirect Link
    [Tags]    Redirect    Navigation
    Go To    ${BASE_URL}redirector
    Click Element    id:redirect
    Sleep    3s
    Location Should Contain    /status_codes
    Sleep    1s

Test Shadow DOM
    [Tags]    ShadowDOM    Modern
    Go To    ${BASE_URL}shadowdom
    Page Should Contain    Simple template
    Sleep    1s

Test Shifting Content Menu
    [Tags]    ShiftingContent    Layout
    Go To    ${BASE_URL}shifting_content/menu
    Reload Page
    Sleep    2s
    Page Should Contain Element    css:.shift
    Sleep    1s

Test Shifting Content Image
    [Tags]    ShiftingContent    Layout
    Go To    ${BASE_URL}shifting_content/image
    Reload Page
    Sleep    2s
    Page Should Contain Element    css:img
    Sleep    1s

Test Shifting Content List
    [Tags]    ShiftingContent    Layout
    Go To    ${BASE_URL}shifting_content/list
    Reload Page
    Sleep    2s
    Wait Until Element Is Visible    css:div.large-6    timeout=10s
    Page Should Contain Element    css:div.large-6
    Sleep    1s

Test Slow Resources
    [Tags]    Performance    Slow
    Go To    ${BASE_URL}slow
    Sleep    5s
    Page Should Contain    Slow Resources
    Sleep    1s

Test Status Codes 200
    [Tags]    StatusCodes    HTTP
    Go To    ${BASE_URL}status_codes/200
    Page Should Contain    200
    Sleep    1s

Test Status Codes 404
    [Tags]    StatusCodes    HTTP
    Go To    ${BASE_URL}status_codes/404
    Page Should Contain    404
    Sleep    1s

Test Status Codes 500
    [Tags]    StatusCodes    HTTP
    Go To    ${BASE_URL}status_codes/500
    Page Should Contain    500
    Sleep    1s

Test Typos
    [Tags]    Typos    Content
    Go To    ${BASE_URL}typos
    Page Should Contain Element    css:p
    Sleep    1s

Test WYSIWYG Editor
    [Tags]    WYSIWYG    Editor
    Go To    ${BASE_URL}tinymce
    Wait Until Element Is Visible    id:mce_0_ifr    timeout=10s
    Select Frame    id:mce_0_ifr
    Wait Until Element Is Visible    id:tinymce    timeout=10s
    Execute JavaScript    document.getElementById('tinymce').innerHTML = 'Testing WYSIWYG Editor'
    Unselect Frame
    Sleep    2s
    Select Frame    id:mce_0_ifr
    Element Should Contain    id:tinymce    Testing WYSIWYG Editor
    Unselect Frame
    Sleep    1s