*** Settings ***

Library    SeleniumLibrary    run_on_failure=Nothing

*** Variables ***

${URL}        https://www.saucedemo.com
${DELAY}        0.1

*** Test Cases ***

Prepare Browser
    #Open Browser     ${URL}    ${BROWSER}     executable_path=${DRIVER} 
    Open Browser  ${URL}  Chrome
    Maximize Browser Window
    Set Selenium Speed    ${DELAY} 

Login    

    Wait Until Page Contains Element    id=login-button
    Input Text	id=user-name	standard_user
    Input Text	id=password	secret_sauce
    Click Element	id=login-button    

Choose Product    
    Wait Until Page Contains Element    id=shopping_cart_container
    Log to console    Shop page loaded ... \n
    #Click Element	xpath=//div[@class='inventory_item' and contains(.,'${item}')]//button[contains(.,'ADD')]
    #Click Button    xpath=//*[@id="inventory_container"]/div/div[5]/div[3]/button    
    Click Element    xpath=//div[@class='inventory_item' and contains(.,'onesie')]//button
    Click Element  //div//button[@id="add-to-cart-sauce-labs-bike-light"]    

Go to Cart    
    Click Element  //div//a[@class="shopping_cart_link"]

Go to Checkout            
    Wait Until Page Contains Element    //div//button[@id="checkout"]
    Sleep  2s
    Click Element  //div//button[@id="checkout"]

Your Information
    Wait Until Page Contains Element     id=postal-code
    Input Text    id=first-name     John
    Input Text    id=last-name         Smith
    Input Text    id=postal-code    12345
    Click Element    xpath=//*[@id="checkout_info_container"]/div/form/div[2]/input
    Sleep  1s
        
Go to Finish
    Wait Until Page Contains Element    //button[@id="finish"]    
    # NOTE: "xpath" optional:
    # Click Element  xpath=//button[@id="finish"]    
    Click Element  //button[@id="finish"]    
    
Verify Solved
    Wait Until Page Contains    THANK YOU FOR YOUR ORDER
    [Documentation]  Success Finished shopping
    Sleep  2s
    Close Browser 
    