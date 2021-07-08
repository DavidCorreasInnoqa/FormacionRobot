*** Settings ***
Library    functions/PythonPathScript.py

Library    po_mobile/Application.py
Library    po_mobile/Login.py


*** Variables ***
${USER}    coper
${PASSWORD}    1234abdc

*** Test Cases ***
Horario-App
    Application.Abrir aplicacion
    Login.Login con usuario ${USER} y contraseña ${PASSWORD}