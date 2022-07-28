*** Settings ***
Library   SeleniumLibrary
Library   DataDriver   LoginCaserobot.xlsx   Sheet_name=Sheet1
Suite Setup   open
Suite Teardown  close
Test Template  invalidlogin




*** Test Cases ***
LoginWithExcel  using ${username}  ${password}
 

*** Keywords ***
open
    Open Browser   https://opensource-demo.orangehrmlive.com/   chrome
close
    Close All Browsers
invalidlogin
    [Arguments]  ${username}   ${password}
    Input Text    xpath://input[@id='txtUsername']    ${username}
    Input Password    xpath://input[@id='txtPassword']    ${password}
    Click Element    xpath://input[@id='btnLogin']
    Element Should Be Visible      xpath://span[@id='spanMessage']
    
