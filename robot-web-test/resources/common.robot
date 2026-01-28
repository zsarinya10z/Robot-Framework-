*** Settings ***
Library     SeleniumLibrary
Resource    ../variables/testdata.robot

*** Keywords ***
Open Web
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window
