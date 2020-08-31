*** Settings ***
Library    SeleniumLibrary
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
    Click Element    xpath://*[contains(@class,'settings dropdown-toggle')]
    Click Element    xpath://${dropdown_list}//li[normalize-space()='${pageName}']

Click Edit Profile Button
    Click Element    xpath://${editButton}//*[text()='編輯個人檔案']

Fillin Field
    [Arguments]    ${fieldName}    ${content}
    Input Text    xpath://*[@placeholder='${fieldName}'or @data-placeholder='${fieldName}']   ${content}

Edit Profile
   Fillin Field    自我介紹             ${userDescription}
   Fillin Field    地點                     ${userLocation}
   Fillin Field    網站                     ${userUrl}
   Click Element    xpath://${ProfilePage-saveButton}

Edited Profile Should Be Shown On The Profile Page
   Element Text Should Be    xpath://${bio}    ${userDescription}
   Element Text Should Be    xpath://${locationText}    ${userLocation}
   Element Text Should Be    xpath://${urlText}    ${userUrl}

Open Brower And Login
   Open Brower To Login Page
   User Login    ${user}

Open Brower To Login Page
   [Arguments]    ${browser}=chrome
   Open Browser    ${twitterURL}    ${browser}
   Maximize Browser Window
   Open Login Page

Open Login Page
   Click Element    xpath://*[contains(@class,'buttonLogin') and normalize-space()='登入']

User Login
   [Arguments]    ${user}
   Input Text    xpath://*[contains(@class,'username-field')]    ${user['account']}
   Input Text    xpath://input[@type='password' and contains(@class,'password-field')]    ${user['password']}
   Click Element    xpath://*[contains(@class,'t1-label')]//input[@name='remember_me' and @checked='checked']
   Click Element   xpath://button[normalize-space()='登入']

*** Variables ***
${twitterURL} =   https://twitter.com/
&{user} =   account=amyautomationtest@gmail.com    password=testAccountPassword
${userName} =   testAccount

${userDescription} =    Hello, I am a test account!
${userLocation} =    Taiwan
${userUrl} =    twitter.com/testAcc60904237
${userColorButton} =    紫色
&{userBirthdate}=    day=18    month=2    year=2000

${shortPeriodOfTime} =    3

${bio} =   *[@class='ProfileHeaderCard']//*[contains(@class,'bio')]
${locationText} =   *[@class='ProfileHeaderCard']//*[contains(@class,'locationText')]
${urlText} =    *[@class='ProfileHeaderCard']//*[contains(@class,'urlText')]
${birthdata} =    *[@class='ProfileHeaderCard']//*[contains(@class,'birthdateText')]
${bgUserColor} =    div[contains(@class,'ProfileCanopy-header u-bgUserColor')]
${ProfilePage-saveButton} =    button[contains(@class,'ProfilePage-saveButton')]
${submit_button} =   button[@id='confirm_dialog_submit_button']
${alert-messages} =   div[@class='alert-messages js-message-drawer-visible']
${取消} =    contains(@class,'ProfilePage') and text()='取消'
${ProfileAvatarEditing} =    @class='ProfileAvatarEditing-button u-boxShadowInsetUserColorHover'
${dropdown_open} =    *[contains(@class,' is-forceRight is-autoCentered')]
${dropdown_list} =   *[contains(@class,'DashUserDropdown')]
${editButton} =   button[contains(@class,'UserActions-editButton')]
${profile-geo}=    div[@id='profile-geo-dropdown']