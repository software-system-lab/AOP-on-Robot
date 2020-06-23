*** Settings ***
Library    SeleniumLibrary
Resource    ./locators/twitter.robot

*** Keywords ***
Wait Until Login Page Is Opened
    Wait Until Element Is Visible    xpath://${toLoginButton}

Wait Until Main Page Is Opened
    Wait Until Element Is Visible    xpath://${mainPage}
    Wait Until Element Is Visible    xpath://${articles}
