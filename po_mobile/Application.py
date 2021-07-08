import json
import os

from AppiumLibrary import AppiumLibrary
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

BuiltIn().import_library('AppiumLibrary')
osm: AppiumLibrary = BuiltIn().get_library_instance('AppiumLibrary')


class Application:
    @keyword(name='Abrir aplicacion')
    def open_app(self):
        # Cargamos las capabilities
        current_path = os.path.dirname(os.path.abspath(__file__))
        with open(current_path + '/../data/mob_capabilities.json') as caps:
            capabilities = json.load(caps)

        # Elegimos las capabilities
        BuiltIn().set_global_variable("${PLATFORM}", "Android")
        current_caps = capabilities["Android"]["Local"]

        # Abrimos aplcacion
        osm.open_application(**current_caps)

    @keyword(name='Cerrar aplicacion')
    def close_app(self):
        BuiltIn().log_to_console("Aplicacion cerrada por script")
        osm.close_application()

