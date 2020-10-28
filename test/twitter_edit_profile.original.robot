*** Settings ***
Library    SeleniumLibrary
Library    TwitterLibrary
Resource    ./locators/twitter.robot
Suite Setup    Open Brower And Login
Suite Teardown    Close Browser

*** Test Cases ***
Edit Profile In Twitter
    Go To Change Profile Page
    Edit Profile
    Edited Profile Should Be Shown On The Profile Page

*** Keywords ***
Go To Change Profile Page
    Go To Setting Page    個人資料
    Click Edit Profile Button

Go To Setting Page
    [Arguments]    ${pageName}
    Wait Until Element Is Visible    ${personalInformation}
    Click Element    ${personalInformation}
    Run Keyword If    '${pageName}'=='個人資料'    Wait Until Profile Page Is Opened
    Run Keyword If    '${pageName}'=='列表'    Wait Until List Page Is Opened

Click Edit Profile Button
    Wait Until Element Is Visible    ${editPersonalInfoButton}
    Click Element    ${editPersonalInfoButton}
    Wait Until Element Is Visible    ${cancelButton}
    Wait Until Element Is Visible    ${profileSaveButton}

Edit Profile
    Wait Until Element Is Visible    ${displayNameInput}
    Input Text    ${displayNameInput}    ${userDescription}
    Wait Until Element Is Visible    ${locationInput}
    Input Text    ${locationInput}       ${userLocation}
    Wait Until Element Is Visible    ${websiteInput}
    Input Text    ${websiteInput}        ${userUrl}
    Click Element    ${profileSaveButton}
    Wait Until Element Is Visible    ${saveSuccessfullyMsg}

Edited Profile Should Be Shown On The Profile Page
    Element Text Should Be    ${descriptionField}    ${userDescription}
    Element Text Should Be    ${locationField}       ${userLocation}
    Element Text Should Be    ${websiteField}        ${userUrl}

Open Brower And Login
    Open Browser    ${twitterURL}    ${browser}
    Maximize Browser Window
    Open Login Page
    User Login    ${userEmail}    ${userPassword}
    Login With User Id If Email-Login Failed

Login With User Id If Email-Login Failed
    ${loginFailed}    Run Keyword And Return Status
    ...               Wait Until Element Is Visible    ${loginWarningMessage}
    Run Keyword If    ${loginFailed}    User Login    ${userId}    ${userPassword}

Open Login Page
    Wait Until Element Is Visible    ${toLoginButton}
    Click Element    ${toLoginButton}

User Login
    [Arguments]    ${account}    ${password}
    Wait Until Element Is Visible    ${userField}
    Input Text    ${userField}    ${account}
    Wait Until Element Is Visible    ${passwordField}
    Input Text    ${passwordField}    ${password}
    Click Element   ${loginButton}
    Wait Until Element Is Visible    ${mainPage}

*** Variables ***
${userDescription} =    Hello, I am a test account!
${userLocation} =    Taiwan
${userUrl} =    twitter.com/testAcc60904237