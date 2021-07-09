from AppiumLibrary import AppiumLibrary
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

from ro_mobile.Locators import get_locators

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
        app_lib.tg_scroll_dynamic_list(self.locators["slcCentro"], center)
