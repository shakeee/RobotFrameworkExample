*** Settings ***
Library        Selenium2Library

*** Variables ***
${browser}                  chrome

${testuser}                 batparkman@gmail.com
${testpassword}             robot1234567

${valid_username}           robot1234567
${valid_email}              testemail007@net.hr
${valid_password}           robot1234567
${button}                   xpath=//*[@id="ego_submit"]
${login_url}                https://wordpress.com/log-in
${registration_url}         https://wordpress.com/start/user

${registration_title}       xpath=//*[@id="step-header"]/p
${registration_sec_step}    xpath=//*[@id="step-header"]/h1
${registration_third_step}  xpath=//*[@id="step-header"]/h1
${email}                    xpath=//*[@id="email"]
${username}                 xpath=//*[@id="username"]
${password}                 xpath=//*[@id="password"]
${button_create}            xpath=//*[@id="primary"]/div/div[2]/div/div/div/div[1]/div[1]/div[1]/form/div[2]/button

${domain_name}              robottesting
${domain}                   xpath=//*[@id="search-component-25"]
${domain_visible}           xpath=//*[@id="primary"]/div/div[2]/div/div/div/div/div/div/div/div[2]/div[2]/div[5]/div/div[1]/h3
${button_select}            xpath=//*[@id="primary"]/div/div[2]/div/div/div/div/div/div/div/div[2]/div[2]/div[5]/button
${button_freesite}          xpath=//*[@id="primary"]/div/div[2]/div/div/div/div/div[1]/div/div/div[2]/div/button
${registration_confirm}     xpath=//*[@id="primary"]/main/div[2]/div/h2

${logout_element}           xpath=//*[@id="header"]/a[3]/span/img
${logout}                   xpath=//*[@id="secondary"]/div/div/div[2]/button

${login_element}            xpath=//*[@id="primary"]/div/main/div/div/div[1]/div
${login_username}           xpath=//*[@id="usernameOrEmail"]
${login_password}           xpath=//*[@id="password"]
${successful_element}       xpath=//*[@id="primary"]/main/header/div/div/span/strong
${password_element}         xpath=//*[@id="primary"]/div/main/div/div/div[1]/div
     
${button_continue}          xpath=//*[@id="primary"]/div/main/div/div/form/div[1]/div[2]/button
${button_login}             xpath=//*[@id="primary"]/div/main/div/div/form/div[1]/div[2]/button

*** Keywords ***
Open Browser to Register
    Open Browser                    ${registration_url}    ${browser}
    Maximize Browser Window
    Login Page Should Be Open

Start Registration
    Registration Form Should Be Open First Step
    Input Text                      ${email}    ${valid_email}
    Input Text                      ${username} ${valid_username}
    Input Text                      ${password} ${valid_password}
    Click Button                    ${button_create}
    Registration Form Should Be Open Second Step
    Input Text                      ${domain}   ${domain_name}
    Wait Until Element Is Visible   ${domain_visible}
    Click Button                    ${button_select}
    Registration Form Should Be Open Second Step
    Click Button                    ${button_freesite}
    Wait Until Element Is Visible   ${registration_confirm}
    Logout

Logout
    Click Button                    ${logout_element}
    Wait Until Element Is Visible   ${logout}
    Click Button                    ${logout}

Registration Form Should Be Open First Step
    Page Should Contain Element     ${registration_title}

Registration Form Should Be Open Second Step
    Page Should Contain Element     ${registration_sec_step} 

Registration Form Should Be Open Third Step
    Page Should Contain Element     ${registration_third_step}


Open Browser To Login 
    Open Browser                    ${login_url}    ${browser}
    Maximize Browser Window
    Login Page Should Be Open

Login Page Should Be Open
    Page Should Contain Element     ${login_element}

#Go To Login Page
#    Go To                           ${login_url}
#    Login Page Should Be Open

Input Username
    #[Arguments]     ${username}
    Input Text                      ${login_username}        ${testuser}
    Click Button                    ${button_continue}

Input Password
    #[Arguments]     ${password}
    Wait Until Element Is Visible   ${password_element}
    Wait Until Element Is Enabled   ${login_password}   
    Input Text                      ${login_password}      ${testpassword}
    Click Button                    ${button_login}

#Submit Credentials
#    Click Button                    ${button}

Welcome Page Should Be Opened
    Wait Until Element Is Visible   ${successful_element}
    Page Should Contain Element     ${successful_element}
