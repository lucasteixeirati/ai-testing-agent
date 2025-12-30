*** Settings ***
Resource    ../resources/common/common_setup.resource
Resource    ../resources/pages/HomePage.resource

Suite Setup     Setup Test Environment
Suite Teardown  Teardown Test Environment

*** Test Cases ***
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

Navigate To Basic Auth Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Basic Auth Link
    Location Should Contain    /basic_auth

Navigate To Broken Images Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Broken Images Link
    Location Should Contain    /broken_images

Navigate To Challenging DOM Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Challenging DOM Link
    Location Should Contain    /challenging_dom

Navigate To Checkboxes Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Checkboxes Link
    Location Should Contain    /checkboxes

Navigate To Context Menu Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Context Menu Link
    Location Should Contain    /context_menu

Navigate To Digest Auth Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Digest Auth Link
    Location Should Contain    /digest_auth

Navigate To Disappearing Elements Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Disappearing Elements Link
    Location Should Contain    /disappearing_elements

Navigate To Drag And Drop Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Drag And Drop Link
    Location Should Contain    /drag_and_drop

Navigate To Dropdown Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Dropdown Link
    Location Should Contain    /dropdown

Navigate To Dynamic Content Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Dynamic Content Link
    Location Should Contain    /dynamic_content

Navigate To Dynamic Loading Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Dynamic Loading Link
    Location Should Contain    /dynamic_loading

Navigate To Entry Ad Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Entry Ad Link
    Location Should Contain    /entry_ad

Navigate To Exit Intent Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Exit Intent Link
    Location Should Contain    /exit_intent

Navigate To File Download Page
    [Tags]    Navigation
    Navigate To Home Page
    Click File Download Link
    Location Should Contain    /download

Navigate To Floating Menu Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Floating Menu Link
    Location Should Contain    /floating_menu

Navigate To Forgot Password Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Forgot Password Link
    Location Should Contain    /forgot_password

Navigate To Frames Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Frames Link
    Location Should Contain    /frames

Navigate To Geolocation Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Geolocation Link
    Location Should Contain    /geolocation

Navigate To Horizontal Slider Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Horizontal Slider Link
    Location Should Contain    /horizontal_slider

Navigate To Hovers Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Hovers Link
    Location Should Contain    /hovers

Navigate To Infinite Scroll Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Infinite Scroll Link
    Location Should Contain    /infinite_scroll

Navigate To Inputs Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Inputs Link
    Location Should Contain    /inputs

Navigate To jQuery UI Menus Page
    [Tags]    Navigation
    Navigate To Home Page
    Click jQuery UI Menus Link
    Location Should Contain    /jqueryui/menu

Navigate To JavaScript Error Page
    [Tags]    Navigation
    Navigate To Home Page
    Click JavaScript Error Link
    Location Should Contain    /javascript_error

Navigate To Key Presses Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Key Presses Link
    Location Should Contain    /key_presses

Navigate To Large Deep DOM Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Large Deep DOM Link
    Location Should Contain    /large

Navigate To Multiple Windows Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Multiple Windows Link
    Location Should Contain    /windows

Navigate To Nested Frames Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Nested Frames Link
    Location Should Contain    /nested_frames

Navigate To Notification Messages Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Notification Messages Link
    Location Should Contain    /notification_message

Navigate To Redirect Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Redirect Link
    Location Should Contain    /redirector

Navigate To Secure File Download Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Secure File Download Link
    Location Should Contain    /download_secure

Navigate To Shadow DOM Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Shadow DOM Link
    Location Should Contain    /shadowdom

Navigate To Shifting Content Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Shifting Content Link
    Location Should Contain    /shifting_content

Navigate To Slow Resources Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Slow Resources Link
    Location Should Contain    /slow

Navigate To Sortable Data Tables Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Sortable Data Tables Link
    Location Should Contain    /tables

Navigate To Status Codes Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Status Codes Link
    Location Should Contain    /status_codes

Navigate To Typos Page
    [Tags]    Navigation
    Navigate To Home Page
    Click Typos Link
    Location Should Contain    /typos

Navigate To WYSIWYG Editor Page
    [Tags]    Navigation
    Navigate To Home Page
    Click WYSIWYG Editor Link
    Location Should Contain    /tinymce