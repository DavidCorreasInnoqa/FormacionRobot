*** Settings ***
Documentation    Probar la pagina de Amazon
Library    SeleniumLibrary
Resource    po_web/Application.resource
Resource    po_web/Login.resource
Resource    po_web/Empleados.Listado.resource

*** Variables ***
# Prioridad en las *** variables ***
#- Linea de comandos (robot -v <NOMBRE_VAR>:<VALOR_VAR>)
#- Script (.robot)
#    - Runtime
#    - Variables
#- Resources (.resources)

#Scopes
#- Global: Accesible por todos los test y keywords (Linea de comandos, Varibles de un script, Keyword: Set global)
#- Suite: Accesible por t\odo el test Suite
#- Test Case: Accesible en el test Case
#- Keywords: Accesible unicamente en las keywords


${VAR_ESCALAR}    Hola
@{LISTA}    Hola2    Adios2    Que tal2
&{DICCIONARIO}    key1=hola    key2=adios    key3=que tal

${USER}    javier

*** Test Cases ***
Test-Buscador
    Application.Abrir Navegador
    Login.Login     Coper   Coper1234
    Empleados.Listado.Abrir Pagina
    Empleados.Listado.Filtro Simple     Federico

    Login.Logout
    Application.Cerrar Navegador


# TEST DE EJEMPLOS

Test-Variables
    ${VAR_ESCALAR}    set variable    Hola
    Log    ${VAR_ESCALAR}    console=True
    Keyword-Log    10

    @{LISTA}    create list    Hola2    Adios2    Que tal2
    Log    ${LISTA}    console=True
    Log    @{LISTA}    console=True
    Log    Hola    Adios    Que tal    console=True

    FOR    ${MENSAJE}    IN    @{LISTA}
        Log    ${MENSAJE}    console=True
    END

    Keyword-Log-Arguments    hola1    adios1    que tal1
    Keyword-Log-Arguments    @{LISTA}

    Keyword-Log    ${LISTA}[-2]

    &{DICTIONARY}    create dictionary    key1=hola    key2=adios    key3=que tal
    Keyword-Log-Arguments    ${DICTIONARY}    console=True
    Log    ${DICTIONARY}[key3]    console=True

Test-Variables-Prioridad
    Log    ${USER}    console=True
    ${GLOBAL}    Set variable    variable global
    set global variable    ${GLOBAL}

Crear Empleado
    [Tags]    Current
    ${EMPLEADO}    Set Variable    Juan
    Set Test Variable    ${EMPLEADO}
    Set Suite Variable    ${EMPLEADO}
    Log    En crear: ${EMPLEADO}    console=True
    Login.Keyword-Acceso-Empleado
    Login.Otra Keyword

Modificar Empleado
    [Tags]    Current
    Log    En modificar: ${EMPLEADO}    console=True

Eliminar Empleado
    [Tags]    Current
    Log    En eliminar: ${EMPLEADO}    console=True

*** Keywords ***
Keyword-Log
    [Arguments]    ${PALABRA}
    Log    ${PALABRA}    console=True

Keyword-Log-Arguments
    [Arguments]    ${ARG1}    ${ARG2}    ${ARG3}
    Log    Arg1: ${ARG1}    console=True
    Log    Arg2: ${ARG2}    console=True
    Log    Arg3: ${ARG3}    console=True