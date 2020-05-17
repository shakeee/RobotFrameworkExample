*** Settings ***
Library        Selenium2Library
Resource       resource.robot

*** Test Cases ***
Valid Register
    Open Browser to Register
    Start Registration
Valid Login
    Open Browser To Login 
    Input Username
    Input Password
    Welcome Page Should Be Opened
    [Teardown]  Close Browser

Trigger Post
    Open Browser To Login 
    Input Username
    Input Password
    Welcome Page Should Be Opened
    Trigger New Post 
    [Teardown]  Close Browser