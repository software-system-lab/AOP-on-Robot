*** Settings ***
Library    SeleniumLibrary
Test Setup    Open Browser    ${twitterURL}    ${browser}
Test Teardown    Close Browser

*** Test Cases ***
Login To Twitter With Valid User
    Go To Login Page
    User Login    &{userAmy}
    User Name Should Be Shown On Main Page    ${userAmy['name']}

*** Keywords ***
Go To Login Page
    Click Element    xpath://${loginButton}

User Login
    [Arguments]    &{user}
    Input Text    xpath://${userField}    ${user['account']}
    Input Text    xpath://${passwordField}    ${user['password']}
    Click Element   xpath://button[normalize-space()='登入']

User Name Should Be Shown On Main Page
    [Arguments]    ${userName}
    Element Should Be Visible    xpath://${dashBoardProfileCard}//*[text()='${userName}']

*** Variables ***
&{userAmy} =   account=amyautomationtest@gmail.com    password=testAccountPassword    name=testAccount
${twitterURL} =   https://twitter.com/
${browser} =    Chrome


${loginButton} =    *[contains(@class,'buttonLogin') and normalize-space()='登入']
${userField} =    *[contains(@class,'username-field')]
${passwordField} =    input[@type='password' and contains(@class,'password-field')]
${dashBoardProfileCard} =   *[contains(@class,'DashboardProfileCard')]
${navBar} =    *[@class='global-nav-inner']