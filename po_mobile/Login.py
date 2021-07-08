from AppiumLibrary import AppiumLibrary
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn
from ro_mobile.Locators import get_locators

osm: AppiumLibrary = BuiltIn().get_library_instance('AppiumLibrary')

class Login:
    def __init__(self):
        platform = BuiltIn().get_variable_value("${PLATFORM}", "Android")
        self.locators = get_locators(platform, "Login")

    @keyword(name='Login con usuario ${user} y contraseña ${password}')
    def open_app(self, user, password):
        osm.wait_until_element_is_visible(self.locators["cajaNombre"])
        osm.input_text(self.locators["cajaNombre"], user)
        osm.input_text(self.locators["cajaPassword"], password)
        osm.click_element(self.locators["btnAcceder"])
