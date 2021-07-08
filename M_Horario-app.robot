*** Settings ***
# Poner siempre
Library    functions/PythonPathScript.py
# =============

Library    po_mobile/Application.py
Library    po_mobile/Login.py

*** Variables ***
${IS_REMOTE}    False
${PLATFORM}    IOS
${USER}    sera
${PASSWD}    1234abcd
${CENTER}    Centro Trainingym

*** Test Cases ***
Horario-Reservas
    Application.Abrir aplicacion

    Login.Hacer login con usuario ${USER} y contrasena ${PASSWD}
#    Login.Seleccionar centro ${CENTER}

    Application.Cerrar Aplicacion