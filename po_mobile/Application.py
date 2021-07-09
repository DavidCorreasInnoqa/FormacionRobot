import json
import os

from AppiumLibrary import AppiumLibrary
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

BuiltIn().import_library("AppiumLibrary")
app_lib: AppiumLibrary = BuiltIn().get_library_instance("AppiumLibrary")


class Application:
    def __init__(self):
        pass

    @keyword(name="Abrir aplicacion")
    def open_app(self):
        # Cargar las capabilities en un diccionario
        current_path = os.path.dirname(os.path.abspath(__file__))
        with open(current_path + '/../data/mob_capabilities.json') as caps:
            capabilities = json.load(caps)

        # Elegir las capabilities
        is_remote = "Remote" if BuiltIn().get_variable_value("${IS_REMOTE}") == 'True' else "Local"
        platform = BuiltIn().get_variable_value("${PLATFORM}")
        current_caps = capabilities[platform][is_remote]

        app_lib.open_application(**current_caps)

    @keyword(name="Cerrar aplicacion")
    def close_app(self):
        BuiltIn().log_to_console("Aplicacion cerrada por RobotFramework")
        app_lib.close_application()
