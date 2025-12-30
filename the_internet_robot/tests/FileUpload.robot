*** Settings ***
Resource    ../resources/common/common_setup.resource
Resource    ../resources/pages/FileUploadPage.resource

Suite Setup     Setup Test Environment
Suite Teardown  Teardown Test Environment

*** Test Cases ***
Upload File Successfully
    [Tags]    FileUpload
    Navigate To File Upload Page
    ${test_file}=    Set Variable    ${CURDIR}${/}test_file.txt
    Create Test File    ${test_file}    Conteúdo do arquivo de teste
    Upload File    ${test_file}
    File Should Be Uploaded Successfully    test_file.txt
    [Teardown]    Cleanup Test File    ${test_file}