*** Settings ***
Library    SeleniumLibrary


*** Variables ***


*** Keywords ***
Abrir Navegador
     open browser    https://devapp-2.trainingym.com/auth   gc
     Maximize Browser Window

Cerrar Navegador
    close browser