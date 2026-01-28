*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/login_keywords.robot
Resource    ../resources/dashboard_keywords.robot

*** Test Cases ***
TC-DASH-001 Access Dashboard After Login
    Open Web
    Login With Valid User
    Verify Dashboard Page
    Logout
    Close Browser
