from typing import Union

from robot.api import SkipExecution
from robot.libraries.BuiltIn import BuiltIn

from robot.api.deco import keyword


ROBOT_LIBRARY_DOC_FORMAT = 'HTML'


class PoRobotFramework4:
    # ------------------------------- Config ------------------------------- #
    ROBOT_LIBRARY_SCOPE = 'TEST SUITE'
    __version__ = '1.0'

    # ------------------------------- Locators ------------------------------- #
    def __init__(self):
        pass

    @keyword(name="Skip Exception")
    def raise_skip(self):
        """
        Documentation here.
        """
        try:
            BuiltIn().fail("Fallo esperado de la página")
        except AssertionError:
            raise SkipExecution("Este error se esperaba y se salta la ejecucion")

    @keyword(name="Convierte argumento ${arg} en tipo Int y si falla la conversion, "
                  "prueba con float")
    def arg_func(self, arg=Union[int, float]):
        """
        The arg argument would first be converted to an integer and if that fails then to a float.

        Because conversion is attempted one-by-one and string conversion always succeeds,
        possible str should be the last type. For example, using Union[str, int] would cause all
        arguments, including integers, to be converted to strings, but Union[int, str] means that
        integer conversion is attempted first and string conversion is done only if that fails.
        """
        BuiltIn().log(f"El tipo de arg es: {type(arg)}. Y su valor: {arg}", console=True)

    @keyword('Add ${quantity:\d+} copies of ${item} to cart')
    def add_copies_to_cart(self, quantity: int, item):
        BuiltIn().log(f"El tipo de quantity es: {type(quantity)}. Y su valor: {quantity}", console=True)
        BuiltIn().log(f"El tipo de item es: {type(item)}. Y su valor: {item}", console=True)

    @keyword(name='Mensaje al log')
    def msg_to_log(self):
        BuiltIn().run_keyword("Comment", "Primero: Keyword")
        print("Segundo: mensaje de libreria")
        BuiltIn().run_keyword("Comment", "Tercero: Keyword")
