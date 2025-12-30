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
    Open Context Menu    id:hot-spot
    Handle Alert    ACCEPT
    Press Keys    None    ESCAPE
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
    Select Frame    name=frame-top
    Select Frame    name=frame-left
    Page Should Contain    LEFT
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