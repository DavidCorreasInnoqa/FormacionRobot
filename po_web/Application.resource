*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${ENV}      Dev2
&{URL}      Dev2=https://devapp-2.trainingym.com/auth
${BROWSER}  gc

*** Keywords ***
Abrir Navegador
     open browser    ${URL}[${ENV}]   ${BROWSER}
     Maximize Browser Window

Cerrar Navegador
    close browser