*** Settings ***
Documentation    Pagina de empleados > Listado
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Abrir Pagina


Filtro Simple


Mostrar Registros Por Pagina

Poner Estado

Annadir Empleado

Annadir.Completar Usuario
    [Documentation]    Completa el campo usuario en el formulario de annadir empleados
    Wait Until Element Is Visible    id=empleadoApodo
    Input Text    id=empleadoApodo    Juan

Annadir.Completar Email

Annadir.Completar Contrasenna

Editar Empleado

Eliminar Empleado