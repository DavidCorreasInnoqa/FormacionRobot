*** Settings ***
Documentation    Probar la pagina de Amazon
Library    SeleniumLibrary

*** Variables ***


*** Test Cases ***
Test-Buscador
     open browser    https://devapp-2.trainingym.com/auth   gc
     Maximize Browser Window
     wait until element is visible   xpath://html/body/app-root/app-auth/nz-layout/nz-sider/div/form/nz-form-item[1]/nz-form-control/div/div/nz-input-group/input   10s
     input text    xpath://html/body/app-root/app-auth/nz-layout/nz-sider/div/form/nz-form-item[1]/nz-form-control/div/div/nz-input-group/input     coper
     input text    xpath://html/body/app-root/app-auth/nz-layout/nz-sider/div/form/nz-form-item[2]/nz-form-control/div/div/nz-input-group/input     coper1234
     wait until element is enabled    id=tg-login-accept
     click element    id=tg-login-accept
     wait until element is visible    xpath://html/body/app-root/app-main/nz-layout/nz-layout/nz-header/nz-content/div/div[2]/app-member-searcher/nz-input-group/input
     input text    xpath://html/body/app-root/app-main/nz-layout/nz-layout/nz-header/nz-content/div/div[2]/app-member-searcher/nz-input-group/input     coper
     close browser

*** Keywords ***
