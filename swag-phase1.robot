# File: swag-phase1.robot

*** Settings ***

Library    SeleniumLibrary    run_on_failure=Nothing

*** Variables ***

${URL}        https://www.saucedemo.com
${DELAY}        0.1

*** Test Cases ***

Prepare Browser
    Open Browser  ${URL}  Chrome
    Maximize Browser Window
    Set Selenium Speed    ${DELAY} 
  
Close Browser
    Sleep  2s
    Close Browser 
