*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/login_keywords.robot
Resource    ../resources/dashboard_keywords.robot

*** Test Cases ***
*** Test Cases ***

TC-LOGIN-001 Valid Login 
    [Tags]    smoke    regression
    Open Web
    Input Text    id=user-name    ${VALID_USER}
    Input Text    id=password     ${VALID_PASS}
    Click Button  id=login-button
    Verify Dashboard Page
    Close Browser


TC-LOGIN-002 Invalid Password
    [Tags]    regression
    Open Web
    Input Text    id=user-name    ${VALID_USER}
    Input Text    id=password     ${INVALID_PASS}
    Click Button  id=login-button
    Page Should Contain    Epic sadface
    Close Browser


TC-LOGIN-003 Empty Username
    [Tags]    regression
    Open Web
    Input Text    id=password     ${VALID_PASS}
    Click Button  id=login-button
    Page Should Contain    Username is required
    Close Browser


TC-LOGIN-004 Empty Password
    [Tags]    regression
    Open Web
    Input Text    id=user-name    ${VALID_USER}
    Click Button  id=login-button
    Page Should Contain    Password is required
    Close Browser


TC-LOGIN-005 Locked Out User
    [Tags]    regression
    Open Web
    Input Text    id=user-name    locked_out_user
    Input Text    id=password     secret_sauce
    Click Button  id=login-button
    Page Should Contain    locked out
    Close Browser
