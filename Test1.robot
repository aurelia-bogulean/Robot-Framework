*** Settings ***

Library    SeleniumLibrary

*** Variables ***
#Scalar variable
${URL}    https://opensource-demo.orangehrmlive.com/
#List variable
@{CREDENTIALS}    Admin    admin123
#Dictionary variable
&{LOGINDATA}    username=Admin    password=admin123

*** Test Cases ***
SampleLoginTestCase
    [Documentation]    This is a sample login test case
    Open Browser       ${url}     chrome
    Set Browser Implicit Wait    3
    Input Text       id=txtUsername         @{CREDENTIALS}[0]       
    Input Text       id=txtPassword         &{LOGINDATA}[password] 
    Click Button    name=Submit
    Click Element    id=welcome
    Click Element    link=Logout            
    Close Browser
    Log    Test is completed  by  %{username} on %{os}
