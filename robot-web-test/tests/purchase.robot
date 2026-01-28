*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/login_keywords.robot
Resource    ../resources/dashboard_keywords.robot

*** Test Cases ***

# =========================
# ✅ HAPPY PATH
# =========================

TC-PUR-HP-001 Buy Single Product
    [Tags]    happy    purchase    smoke
    Open Web
    Login With Valid User
    Add Product To Cart    Sauce Labs Backpack
    Go To Cart
    Click Checkout
    Fill Checkout Info    John    Doe    10110
    Finish Checkout
    Page Should Contain    Thank you for your order
    Close Browser


TC-PUR-HP-002 Buy Multiple Products
    [Tags]    happy    purchase
    Open Web
    Login With Valid User
    Add Product To Cart    Sauce Labs Backpack
    Add Product To Cart    Sauce Labs Bike Light
    Go To Cart
    Click Checkout
    Fill Checkout Info    Jane    Smith    20220
    Finish Checkout
    Page Should Contain    Thank you for your order
    Close Browser


# =========================
# ❌ NEGATIVE CASES
# =========================

TC-PUR-NG-001 Checkout With Empty Cart
    [Tags]    negative    purchase
    Open Web
    Login With Valid User
    Go To Cart
    Click Checkout
    Page Should Contain    Cart is empty
    Close Browser


TC-PUR-NG-002 Missing First Name
    [Tags]    negative    purchase
    Open Web
    Login With Valid User
    Add Product To Cart    Sauce Labs Backpack
    Go To Cart
    Click Checkout
    Fill Checkout Info    ${EMPTY}    Doe    30330
    Page Should Contain    First Name is required
    Close Browser


TC-PUR-NG-003 Missing Last Name
    [Tags]    negative    purchase
    Open Web
    Login With Valid User
    Add Product To Cart    Sauce Labs Backpack
    Go To Cart
    Click Checkout
    Fill Checkout Info    John    ${EMPTY}    40440
    Page Should Contain    Last Name is required
    Close Browser


TC-PUR-NG-004 Missing Zip Code
    [Tags]    negative    purchase
    Open Web
    Login With Valid User
    Add Product To Cart    Sauce Labs Backpack
    Go To Cart
    Click Checkout
    Fill Checkout Info    John    Doe    ${EMPTY}
    Page Should Contain    Postal Code is required
    Close Browser


# =========================
# 🔁 REPEAT / REGRESSION
# =========================

TC-PUR-RG-001 Buy Same Product Twice
    [Tags]    regression    purchase
    Open Web
    Login With Valid User
    Add Product To Cart    Sauce Labs Backpack
    Add Product To Cart    Sauce Labs Backpack
    Go To Cart
    Page Should Contain    Sauce Labs Backpack
    Click Checkout
    Fill Checkout Info    Mike    Ross    50550
    Finish Checkout
    Page Should Contain    Thank you for your order
    Close Browser


TC-PUR-RG-002 Logout And Continue Purchase
    [Tags]    regression    purchase
    Open Web
    Login With Valid User
    Add Product To Cart    Sauce Labs Backpack
    Logout
    Login With Valid User
    Go To Cart
    Page Should Contain    Sauce Labs Backpack
    Click Checkout
    Fill Checkout Info    Rachel    Zane    60660
    Finish Checkout
    Page Should Contain    Thank you for your order
    Close Browser


TC-PUR-RG-003 Cancel Checkout
    [Tags]    regression    purchase
    Open Web
    Login With Valid User
    Add Product To Cart    Sauce Labs Backpack
    Go To Cart
    Click Checkout
    Click Button    id=cancel
    Page Should Contain    Your Cart
    Close Browser
