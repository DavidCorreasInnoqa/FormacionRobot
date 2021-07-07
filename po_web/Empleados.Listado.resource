*** Settings ***
Documentation    Pagina de empleados > Listado
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Abrir Pagina
    [Documentation]  Abrir la página del listado de empleados
    Wait Until Element Is Visible  xpath://html/body/app-root/app-main/nz-layout/nz-sider/div/ul/li[4]/div[1]/span[2]/span  20
    Click Element  xpath://html/body/app-root/app-main/nz-layout/nz-sider/div/ul/li[4]/div[1]/span[2]/span
    Wait Until Element Is Visible  xpath://html/body/app-root/app-main/nz-layout/nz-sider/div/ul/li[4]/div[2]/ul/span[1]/li[1]/span
    Click Element  xpath://html/body/app-root/app-main/nz-layout/nz-sider/div/ul/li[4]/div[2]/ul/span[1]/li[1]/span
    Wait Until Element Is Visible  xpath://iframe[@name='imain']  20
    Select Frame  xpath://iframe[@name='imain']
    Wait Until Element Is Visible  xpath://div[@id='tList_filter']/label/input  20

Filtro Simple
    [Arguments]     ${filtro}
    Wait Until Element Is Visible  xpath://div[@id='tList_filter']/label/input
    Input Text  xpath://div[@id='tList_filter']/label/input  ${filtro}
    Wait Until Element Is Visible  xpath://a[text()='${filtro}']  20

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