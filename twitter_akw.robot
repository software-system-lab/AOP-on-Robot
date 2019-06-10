*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Wait Until Login Page Is Opened
    Wait Until Element Is Visible    xpath://h1[text()='登入 Twitter']

Wait Until Main Page Is Opened
    Wait Until Element Is Visible    xpath://*[@class='global-nav-inner']//${mainPage}
    Wait Until Element Is Visible    xpath://*[@id='page-container']


*** Variables ***
${mainPage} =    *[@class='text' and text()='首頁']