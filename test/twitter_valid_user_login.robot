*** Settings ***
Library    SeleniumLibrary
Library    TwitterLibrary
Force Tags    only
Resource    ./locators/twitter.robot
Test Setup    Run Keywords    Open Browser    ${twitterURL}    ${browser}
...                    AND    Maximize Browser Window
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