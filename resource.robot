*** Settings ***
Library        Selenium2Library

*** Variables ***
${browser}              chrome
${valid_user}           testemail007@net.hr
${valid_password}       test123
${button}               xpath=//*[@id="ego_submit"]
${login_url}            https://user.net.hr/
${successful_url}       https://freemail.net.hr/
${login_element}        xpath=//*[@id="headerLogoMail"]/img
${successful_element}   xpath=//*[@id="logo"]/a/span
     
#*** Test Cases ***
#Open Google
#  Navigate To Google
#  Verify Page Contains Google

#Navigate To Google
#  Open Browser   https://www.google.com   browser=chrome
#  Input Text 
#Verify Page Contains Google
#  ${Get_title}=      Get Title
#  Should Be Equal As Strings     ${Get_title}   Google

#  Close Browser
*** Keywords ***
Open Browser To Login 
    Open Browser    ${login_url}   ${browser}
    Maximize Browser Window
    Login Page Should Be Open

Login Page Should Be Open
    Page Should Contain Element     ${login_element}

Go To Login Page
    Go To       ${login_url}
    Login Page Should Be Open

Input Username
    #[Arguments]     ${username}
    Input Text      ego_user      ${valid_user}

Input Password
    #[Arguments]     ${password}
    Input Text      ego_secret      ${valid_password}

Submit Credentials
    Click Button    ${button}

Welcome Page Should Be Opened
    Location Should Be      ${successful_url}
    Page Should Contain Element     ${successful_element}
