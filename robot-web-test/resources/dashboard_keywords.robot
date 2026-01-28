*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/testdata.robot

*** Keywords ***

Verify Dashboard Page
    Page Should Contain    ${DASHBOARD_TEXT}

Logout
    Click Link    id=logout

Add Product To Cart
    [Arguments]    ${product_name}
    Click Button    xpath=//div[text()='${product_name}']/ancestor::div[@class='inventory_item']//button

Go To Cart
    Click Link    class=shopping_cart_link

Click Checkout
    Click Button    id=checkout

Fill Checkout Info
    [Arguments]    ${fname}    ${lname}    ${zip}
    Input Text    id=first-name    ${fname}
    Input Text    id=last-name     ${lname}
    Input Text    id=postal-code   ${zip}
    Click Button  id=continue

Finish Checkout
    Click Button    id=finish
