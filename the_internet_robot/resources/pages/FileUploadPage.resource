*** Settings ***
Library    SeleniumLibrary
Library    ../../config/locators.py
Library    OperatingSystem

*** Keywords ***
Navigate To File Upload Page
    Go To    ${BASE_URL}upload

Create Test File
    [Arguments]    ${filename}    ${content}=Test file content
    Create File    ${filename}    ${content}

Upload File
    [Arguments]    ${file_path}
    Choose File    ${FileUploadPageLocators.FILE_INPUT}    ${file_path}
    Click Element    ${FileUploadPageLocators.UPLOAD_BUTTON}

File Should Be Uploaded Successfully
    [Arguments]    ${filename}
    Wait Until Element Is Visible    ${FileUploadPageLocators.UPLOADED_FILES}
    Element Should Contain    ${FileUploadPageLocators.UPLOADED_FILES}    ${filename}

Cleanup Test File
    [Arguments]    ${file_path}
    Remove File    ${file_path}