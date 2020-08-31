from SeleniumLibrary import SeleniumLibrary
from robot.api.deco import keyword
import selenium
from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver

import os
import signal

__version__ = '1.0'

class TwitterLibrary:

    @property
    def selenium(self):
        return BuiltIn().get_library_instance('SeleniumLibrary')

    @property
    def builtIn(self):
        return BuiltIn()

    def get_locator(self, name):
        return self.builtIn.get_variable_value('${' + name + '}')

    @keyword(name='Wait Until Main Page Is Opened')
    def wait_until_main_page_is_shown(self):
        self.selenium.wait_until_element_is_visible("//*[contains(@class,'DashboardProfileCard')]//*[text()='%s']" % BuiltIn().get_variable_value('${userName}'))

    @keyword(name='Wait Until Edit Profile Page Is Opened')
    def wait_until_edit_profile_page_is_opened(self):
        closeModalButton = self.get_locator('closePersonalInfoEditModalButton')
        self.selenium.wait_until_page_contains_element(closeModalButton, 3)
        addAvaterButton = self.get_locator('addAvaterButton')
        self.selenium.wait_until_page_contains_element(addAvaterButton, 3)

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
        editPersonalInfoButton = self.get_locator('editPersonalInfoButton')
        self.selenium.wait_until_element_is_visible(editPersonalInfoButton, 3)

    @keyword(name='Wait Until List Page Is Opened')
    def wait_until_list_page_is_opened(self):
        self.selenium.wait_until_element_is_visible("//*[@class='ProfileNav-item ProfileNav-item--lists is-active']")
        self.selenium.wait_until_element_is_visible("//*[@class='ListCreationModule module']//*[text()='建立列表']")

    @keyword(name='Wait Until Profile Is Saved')
    def wait_until_profile_is_saved(self):
        closeModalButton = self.get_locator('closePersonalInfoEditModalButton')
        self.selenium.wait_until_page_does_not_contain_element(closeModalButton, 3)
        addAvaterButton = self.get_locator('addAvaterButton')
        self.selenium.wait_until_page_does_not_contain_element(addAvaterButton, 3)
