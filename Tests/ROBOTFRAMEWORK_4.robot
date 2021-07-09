*** Settings ***
Library    ../po_web/PoRobotFramework4.py

*** Variables ***


*** Test Cases ***
# robot --skiponfailure Incidencia --skip Movil -d results ROBOTFRAMEWORK_4.robot

NEW-SKIP
    [Documentation]  Nuevo estado para tareas

    Comment    Tests can use new Skip and Skip If BuiltIn keywords
    Skip

    ${STATUS}    ${_}    Run Keyword And Ignore Error  Wait Until Page Contains Element  pid=PageInDevelopment
    Skip if    '${STATUS}'=='FAIL'


    Comment    Libraries can raise an exception that tells that the test should be skipped.
    ...        The easiest way is using the new robot.api.SkipExecution
    PoRobotFramework4.Skip Exception

    Comment    Setup is skipped -> All test skipped
    ...        suite teardown is skipped ->  all tests in the suite are marked skipped retroactively


FLAG-SKIP-MOVIL
    [Documentation]    Test para probar el flag de skip. Debe de tener tag e indicarse en linea de comandos:
    ...                New command line option --skip can be used to skip tests based on tags without running them
    ...                robot --skip Movil -d results ROBOTFRAMEWORK_4.robot
    [Tags]    Movil

    Fail    Prueba contiene movil


FLAG-SKIP-INCIDENCIA
    [Documentation]    Test para probar el flag de skip. Debe de tener tag e indicarse en linea de comandos:
    ...                New command line option --skiponfailure can be used to skip tests IF FAILS based on tags without running them.
    ...                robot --skiponfailure Incidencia -d results ROBOTFRAMEWORK_4.robot
    [Tags]    Incidencia

    Fail    Prueba contiene incidencia


CRITICALY-REMOVED
    [Documentation]    Han quitado el estado de critico porque con skip, habria 4 estados.
    Pass Execution    Prueba que pasa


NATIVE-IF_ELSE
    [Documentation]    Ya no hace falta usar la keyword Run Keyword If para todo.
    Pass Execution    Prueba que no hace nada
    Comment    Si no se usan las llaves coge el valor de la variable y no se pasa a String. $COUNT = 0 / ${COUNT} = '0'

    IF    $COUNT > 0
        Comment    Keyword ejecutado solo en ES
    END


    IF    '${COD_PAIS}'='es'
        Comment    Keyword ejecutado solo en ES
    ELSE
        Comment    Keyword ejecutado en todos los paises menos ES
    END


    IF    "${direction}" == "STRAIGHT"
        Log    Going straight

    ELSE IF    "${direction}" == "LEFT"
        Log    Turning left

    ELSE IF    "${direction}" == "RIGHT"
        Log    Turning right

    ELSE
        Fail    Unrecognized direction: ${direction}
    END


NESTED-CONTROL-STRUCTURES
    [Documentation]    Estructuras de control anidadas.
    Pass Execution    Prueba que no hace nada

    FOR    ${row}    IN    @{rows}
        FOR    ${cell}    IN    @{row}
            IF    "${cell}" != "IGNORE"
                Process Cell    ${cell}
            END
        END
    END


LIBDOC_ENHANCEMENTS
    [Documentation]    Ctrl+Q para abrir la documentacion en Pycharm. Nuevas documentaciones de librarias: https://marketsquare.github.io/robotframework-browser/Browser.html
    Pass Execution    Prueba que no hace nada


ARGUMENT-CONVERSATION-ENHANCEMENTS
    [Documentation]    El paso de argumentos ha sido mejorado, tanto para los .resources como para los .py
    Log    Keyword: Convierte argumento 1.2 en tipo Int y si falla la conversion, prueba con float    console=True
    PoRobotFramework4.Convierte argumento 1.2 en tipo Int y si falla la conversion, prueba con float
    Log    Keyword: Add 7 copies of coffee to cart    console=True
    PoRobotFramework4.Add 7 copies of coffee to cart


LIST-DICTIONARY-EXPANSIONS
    [Documentation]    Mejoras en el acceso a listas y diccionarios

    Comment    No me ha funcionado: Both @{var}[item] and &{var}[item] first make a normal variable item lookup, exactly like when using ${var}[item]
    @{LIST}    Create List    1    2    3    4    5
    &{DICTIONARY}    Create Dictionary    uno=1    dos=2    tres=3    cuatro=4    cinco=5    todos=@{LIST}
    Log    Valor en el diccionario 'todos': @{DICTIONARY}[todos]    console=True

    Comment    Nested access like @{var}[item1][item2] and using the slice notation with lists like @{var}[1:] are supported as well
    Log    Valor en el diccionario 'todos' y en la lista posicion '1': ${DICTIONARY}[todos][1]    console=True

    Comment    Con esto podemos hacer bucles más contenidos
    FOR    ${item}    IN    @{DICTIONARY}[todos]
        Log    ${item}    console=True
    END
    Comment    Y asi es como habia que hacerlo antes
    @{items} =    Set Variable    ${DICTIONARY}[todos]
    FOR    ${item}    IN    @{items}
        Log    ${item}    console=True
    END


KEYWORDS-AND-MSG-IN-ORDER
    [Documentation]    Ahora las keyword de los robot (.resource) y los mensajes que generan las librerias (.py) estan en orden en el log
    ...    ESTAFA: no me funciona
    ...    Comportamiento igual al de Inicio Turno en: http://esdc1cspla414.emea.prosegur.local:8080/view/QA%20Automatizacion/job/QA-Automatizacion/job/POPS/view/FICHAJES-BR/job/02-BR-POPS-FICHAJES-INICIO_TURNO_ADELANTADO_PRE10_/123/robot/report/log.html
    PoRobotFramework4.Mensaje al log


KEYWORDS-AFTER-FAILURE->NOT_RUN
    [Documentation]    Ahora aparecen las keywords que no se han ejecutado cuando falla
    Comment    Paso 1
    Fail    Paso2
    Comment    Paso 3
    Comment    Paso 4


CARACTERISTICAS-NO-SOPORTADAS
    Comment    Antiguos for :FOR
    Comment    Significado de @{var}[item] and &{var}[item] ha cambiado
    Comment    Conversion en las variables en las keywords
    Comment    Output.xml ha cambiado, pero no lo usabamos