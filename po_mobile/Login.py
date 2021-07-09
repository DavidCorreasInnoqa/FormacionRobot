from AppiumLibrary import AppiumLibrary
from appium.webdriver.common.mobileby import MobileBy
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

from ro_mobile.Locators import get_locators
from appium.webdriver.webelement import WebElement

app_lib: AppiumLibrary = BuiltIn().get_library_instance("AppiumLibrary")

class Login:
    def __init__(self):
        platform = BuiltIn().get_variable_value("${PLATFORM}", "Android")
        self.locators = get_locators(platform, "Login")

    @keyword(name="Hacer login con usuario ${user} y contrasena ${passwd}")
    def login(self, user, passwd):
        app_lib.wait_until_element_is_visible(self.locators["cajaNombre"])
        app_lib.input_text(self.locators["cajaNombre"], user)
        app_lib.input_text(self.locators["cajaPassword"], passwd)
        app_lib.click_element(self.locators["btnAcceder"])

    @keyword(name="Seleccionar centro ${center}")
    def selct_center(self, center):

        def get_item_with_text(text, item_list):
            for element in item_list:
                if element.text == text:
                    return element
            else:
                app_lib.swipe(100, 700, 50, 50)
                new_items = list_element.find_elements(MobileBy.XPATH, ".//*")
                if new_items == item_list:
                    raise Exception(f"En la lista no se ha encontrado el item con el texto: {text}")
                return get_item_with_text(text, new_items)

        app_lib.wait_until_element_is_visible("com.Intelinova.TgApp:id/list_selector_center")
        list_element: WebElement = app_lib.get_webelement("com.Intelinova.TgApp:id/list_selector_center")
        load_items = list_element.find_elements(MobileBy.XPATH, ".//*")
        item = get_item_with_text(center, load_items)
        item.click()
