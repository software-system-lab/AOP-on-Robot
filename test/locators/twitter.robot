# Locators of Twitter updated on 08/31/2020

*** Variables ***
${userEmail} =       amyautomationtest@gmail.com
${userName} =        testAccount
${userId} =          testAcc60904237
${userPassword} =    testAccountPassword
${twitterURL} =   https://twitter.com/?lang=zh-tw
${browser} =      Chrome
${shortPeriodOfTime} =    3

${toLoginButton} =                       //*[@role='button' and .//*[text()='登入']]
${loginButton} =                         //main//*[@role='button' and .//*[text()='登入']]
${userField} =                           //main//input[contains(@name, 'name')]
${passwordField} =                       //main//input[contains(@name, 'password')]
${dashBoardProfileCard} =                //*[contains(@class,'DashboardProfileCard')]
${navBar} =                              //*[@class='global-nav-inner']
${mainPage} =                            //*[contains(@aria-label, '首頁')]
${articles} =                            //section[contains(@role, 'region')]
${userAvatar} =                          //header//*[contains(@role, 'presentation')]
${loginWarningMessage} =                 //span[normalize-space()='你的帳戶出現不尋常的登入活動。為協助保護帳戶安全，請輸入你的電話號碼或使用者名稱，確認這是你本人。']
${personalInformation} =                 //*[@aria-label='個人資料']
${editPersonalInfoButton} =              //*[text()='編輯個人資料']
${closePersonalInfoEditModalButton} =    //*[@aria-label='關閉']
${addAvaterButton} =                     //*[@aria-label='加入頭像相片']
${displayNameInput} =                    //input[@name='displayName']
${locationInput} =                       //input[@name='location']
${websiteInput} =                        //input[@name='url']
${profileSaveButton} =                   //*[@role='button' and normalize-space()='儲存']
${descriptionField} =                    //*[@data-testid='UserDescription']
${locationField} =                       (//*[@data-testid='UserProfileHeader_Items']/*)[1]
${websiteField} =                        (//*[@data-testid='UserProfileHeader_Items']/*)[2]