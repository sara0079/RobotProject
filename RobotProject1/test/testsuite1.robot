*** Settings ***
Library    SeleniumLibrary   

Suite Setup    Log    I am inside Test Suite Setup
Suite Teardown    Log    I am inside Test Suite Teardown
Test Setup    Log    I am inside Test Setup
Test Teardown    Log    I am inside Test Teardown
Default Tags    Sanity        

*** Test Cases ***
MyFirstTest
    [Tags]    Smoke
    Log  Hello World...
    
MySecondTest
    Log  Hello World...
    Set Tags    Regression
    Remove Tags    Regression
    
MyThirdTest
    Log  Hello World...
    
FirstSeleniumTest
    Open Browser    https:google.com    chrome
    Set Browser Implicit Wait    5
    Input Text    name=q    Automation Step by Step
    Press Keys    name=q    ENTER
    #Click Button    name=btnk    
    Sleep    2       
    Close Browser    
    Log    Test Completed    
    
SampleLoginTest
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    5
    LoginKeyWord    
    Sleep    2    
    Click Element    id=welcome
    Sleep    2    
    Click Link    link=Logout
    Close Browser   
    Log    Test Completed           
    Log    This test was run by %{username} on %{os}         
    
*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKeyWord
    Input Text    id=txtUsername    ${CREDENTIALS}[0]
    Input Password    id=txtPassword    &{LOGINDATA}[password]
    Click Button    id=btnLogin
