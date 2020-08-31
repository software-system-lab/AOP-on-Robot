*** Settings ***
Library    SeleniumLibrary
Library    TwitterLibrary
Resource    ./locators/twitter.robot
Test Setup    Run Keywords    Open Browser    ${twitterURL}    ${browser}
...                    AND    Maximize Browser Window
Test Teardown    Close Browser

*** Test Cases ***
Login To Twitter With Valid User
    Go To Login Page
    User Login    ${userEmail}    ${userPassword}
    Login With User Id If Email-Login Failed
    User Name Should Be Shown On Main Page    ${userName}

*** Keywords ***
Go To Login Page
    Click Element    ${toLoginButton}

User Login
    [Arguments]    ${account}    ${password}
    Input Text    ${userField}    ${account}
    Input Text    ${passwordField}    ${password}
    Click Element   ${loginButton}

Login With User Id If Email-Login Failed
    ${loginFailed}    Run Keyword And Return Status    Wait Until Element Is Visible    ${loginWarningMessage}
    Run Keyword If    ${loginFailed}    User Login    ${userId}    ${userPassword}

User Name Should Be Shown On Main Page
    [Arguments]    ${userName}
    Element Should Be Visible    ${userAvatar}