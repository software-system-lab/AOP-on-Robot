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
    Click Element    ${personalInformation}

Click Edit Profile Button
    Click Element    ${editPersonalInfoButton}

Edit Profile
    Input Text    ${displayNameInput}    ${userDescription}
    Input Text    ${locationInput}       ${userLocation}
    Input Text    ${websiteInput}        ${userUrl}
    Click Element    ${profileSaveButton}

Edited Profile Should Be Shown On The Profile Page
    Element Text Should Be    ${descriptionField}    ${userDescription}
    Element Text Should Be    ${locationField}       ${userLocation}
    Element Text Should Be    ${websiteField}        ${userUrl}

Open Brower And Login
    Open Browser    ${twitterURL}    ${browser}
    Maximize Browser Window
    Open Login Page
    User Login    ${userEmail}    ${userPassword}

Open Login Page
    Click Element    ${toLoginButton}

User Login
    [Arguments]    ${account}    ${password}
    Input Text    ${userField}    ${account}
    Input Text    ${passwordField}    ${password}
    Click Element   ${loginButton}

*** Variables ***
${userDescription} =    Hello, I am a test account!
${userLocation} =    Taiwan
${userUrl} =    twitter.com/testAcc60904237