*** Settings ***
Documentation    Probar la pagina de Amazon
Library    SeleniumLibrary
Resource    po_web/Application.resource
Resource    po_web/Login.resource
Resource    po_web/Empleados.Listado.resource

*** Variables ***


*** Test Cases ***
Test-Buscador
    Application.Abrir Navegador
    Login.Login     Coper   Coper1234

    Empleados.Listado.Abrir Pagina

    Empleados.Listado.Filtro Simple     Federico

    Login.Logout

*** Keywords ***
