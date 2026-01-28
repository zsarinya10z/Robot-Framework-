*** Settings ***
Resource    ../resources/common.robot

*** Test Cases ***
TC-SMOKE-001 Open Website
    Open Web
    Title Should Be    Example Domain
    Close Web
