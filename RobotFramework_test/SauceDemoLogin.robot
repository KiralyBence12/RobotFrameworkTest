*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Open Sauce Demo
    Open Browser     https://www.saucedemo.com/    firefox
    Input Text    //*[@id=user-name]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]
    Sleep    10s
    Page Should Contain Element    //*[@id="shopping_cart_container"]/a
    Close Browser

Login with standard_user wrong password
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    //*[@id=user-name]    standard_user
    Input Password    //*[@id="password"]    secret
    Click Button    //*[@id="login-button"]
    Sleep    10s
    Page Should Contain Element    //*[@id="shopping_cart_container"]/a
    Close Browser

Login with wrong username and valid password
    Open Browser     https://www.saucedemo.com/    firefox
    Input Text    //*[@id=user-name]    standard
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]
    Sleep    10s
    Page Should Contain Element    //*[@id="shopping_cart_container"]/a
    Close Browser

Login without username
    Open Browser     https://www.saucedemo.com/    firefox
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]
    Sleep    10s
    Page Should Contain Element    
    Close Browser

Login without password
    Open Browser     https://www.saucedemo.com/    firefox
    Input Text    //*[@id="user-name"]    standard_user
    Click Button    //*[@id="login-button"]
    Sleep    2s
    Page Should Contain Element    //*[@id="login_button_container"]/div/form/div[3]
    Page Should Contain    text=Password is required
    Close Browser
