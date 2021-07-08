*** Settings ***
Library    functions/PythonPathScript.py

Library    po_mobile/Application.py
Library    po_mobile/Login.py


*** Variables ***
${USER}    coper111
${PASSWORD}    1234abcd

*** Test Cases ***
Horario-App
    Application.Abrir aplicacion
    Login.Login con usuario ${USER} y contraseña ${PASSWORD}