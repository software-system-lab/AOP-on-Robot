*** Settings ***
Library    SeleniumLibrary
Resource    ./locators/twitter.robot

*** Keywords ***
Wait Until Login Page Is Opened
    Wait Until Element Is Visible    ${toLoginButton}

Wait Until Main Page Is Opened
    Wait Until Element Is Visible    ${mainPage}
    Wait Until Element Is Visible    ${articles}
