*** Settings ***
Library    SeleniumLibrary
Library    twitterLibrary
Resource    ./locators/twitter.robot
Test Setup    Open Browser    ${twitterURL}    ${browser}
Test Teardown    Close Browser

*** Test Cases ***
Login To Twitter With Valid User
    Go To Login Page
    User Login    &{userAmy}
    User Name Should Be Shown On Main Page    ${userAmy['name']}

*** Keywords ***
Go To Login Page
    Click Element    xpath://${toLoginButton}

User Login
    [Arguments]    &{user}
    Input Text    xpath://${userField}    ${user['account']}
    Input Text    xpath://${passwordField}    ${user['password']}
    Click Element   xpath://${loginButton}

User Name Should Be Shown On Main Page
    [Arguments]    ${userName}
    Element Should Be Visible    xpath://${userAvatar}