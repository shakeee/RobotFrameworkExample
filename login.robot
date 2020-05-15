*** Settings ***
Library        Selenium2Library
Resource       resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login 
    Input Username  #testemail007@net.hr
    Input Password  #test123
    Submit Credentials
    Welcome Page Should Be Opened
    [Teardown]      Close Browser