from SeleniumLibrary import SeleniumLibrary
from robot.api.deco import keyword
import selenium
from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver

import os
import signal

__version__ = '1.0'

class twitterLibrary:

    """ Library for demo purposes
    """

    def __init__(self, *args, **kwargs):
        pass
    
    @property
    def selenium(self):
        return BuiltIn().get_library_instance('SeleniumLibrary')
    
    @keyword(name='Wait Until Main Page Is Opened')
    def wait_until_main_page_is_shown(self):
        self.selenium.wait_until_element_is_visible("//*[contains(@class,'DashboardProfileCard')]//*[text()='%s']" % BuiltIn().get_variable_value('${userName}'))
 
    @keyword(name='Wait Until Login Page Is Opened')
    def wait_until_login_page_is_opened(self):
        self.selenium.wait_until_element_is_visible("//*[contains(@class,'username-field')]")
         
    @keyword(name='Wait Until Edit Profile Page Is Opened')
    def wait_until_edit_profile_page_is_opened(self):
        self.selenium.wait_until_page_contains_element("//button[contains(@class,'ProfilePage') and text()='取消']", 3)
        self.selenium.wait_until_page_contains_element("//button[@class='ProfileAvatarEditing-button u-boxShadowInsetUserColorHover']//*[text()='加入個人資料相片']", 3)

    @keyword(name='Wait Until Element Is Shown On Page')
    def wait_until_element_is_shown_on_page(self, locator):
        self.selenium.wait_until_page_contains_element(locator)
        self.selenium.wait_until_element_is_visible(locator)
    
    @keyword(name='Wait Until Input Field Is Enable')
    def wait_until_input_field_is_enable(self, locator):
        self.selenium.wait_until_page_contains_element(locator)
        self.selenium.wait_until_element_is_visible(locator)
        self.selenium.wait_until_element_is_enabled(locator)
        
    @keyword(name='Wait Until Profile Page Is Opened')
    def wait_until_profile_page_is_opened(self):
        self.selenium.wait_until_element_is_visible("//button[contains(@class,'UserActions-editButton')]//*[text()='編輯個人檔案']", 3)
        self.selenium.wait_until_element_is_visible("//div[@class='MoveableModule']")
   
    @keyword(name='Wait Until List Page Is Opened')
    def wait_until_list_page_is_opened(self):
        self.selenium.wait_until_element_is_visible("//*[@class='ProfileNav-item ProfileNav-item--lists is-active']")
        self.selenium.wait_until_element_is_visible("//*[@class='ListCreationModule module']//*[text()='建立列表']")
    
    @keyword(name='Wait Until Profile Is Saved')
    def wait_until_profile_is_saved(self):
        self.selenium.wait_until_element_is_visible("//div[@class='alert-messages js-message-drawer-visible']//*[text()='你的個人檔案已被儲存。']")        
    
    @keyword(name='Wait Until Profile Geo Dropdown Is Opened')
    def wait_until_profile_geo_dropdown_is_opened(self):
        self.selenium.wait_until_element_is_visible("//div[@id='profile-geo-dropdown']")  
        