*** Settings ***
Documentation    Probar la pagina de Amazon
Library    SeleniumLibrary

*** Variables ***


*** Test Cases ***
Test-Buscador
    open browser    https://amazon.es    gc
    Maximize Browser Window
    Wait Until Element Is Visible    id=twotabseardasfchtextbox
    Input Text    id=twotabsearchtextbox    Ferrari 458
    Press Keys    id=twotabsearchtextbox    ENTER
    Wait Until Page Contains Element    //span[text()='"Ferrari 458"']
    close browser







*** Keywords ***
