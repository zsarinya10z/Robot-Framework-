*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/testdata.robot

*** Keywords ***
Login With Valid User
    Input Text    id=username    ${VALID_USER}
    Input Text    id=password    ${VALID_PASS}
    Click Button  id=login

Login With Invalid Password
    Input Text    id=username    ${VALID_USER}
    Input Text    id=password    ${INVALID_PASS}
    Click Button  id=login
*** Keywords ***


