# Locators for Twitter updated on 6/23

*** Variables ***
&{userAmy} =   account=amyautomationtest@gmail.com    password=testAccountPassword    name=testAccount
${twitterURL} =   https://twitter.com/?lang=zh-tw
${browser} =    Chrome

${toLoginButton} =    *[@role='button' and .//*[text()='登入']]
${loginButton} =    main//*[@role='button' and .//*[text()='登入']]
${userField} =    main//input[contains(@name, 'name')]
${passwordField} =    main//input[contains(@name, 'password')]
${dashBoardProfileCard} =   *[contains(@class,'DashboardProfileCard')]
${navBar} =    *[@class='global-nav-inner']
${mainPage} =    *[contains(@aria-label, '首頁')]
${articles} =    section[contains(@role, 'region')]
${userAvatar} =    header//*[contains(@role, 'presentation')]