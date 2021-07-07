*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${USER}        coper
#${PASSWORD}    coper1234

${CMP_USUARIO}    xpath://html/body/app-root/app-auth/nz-layout/nz-sider/div/form/nz-form-item[1]/nz-form-control/div/div/nz-input-group/input
${CMP_PASSWORD}    xpath://html/body/app-root/app-auth/nz-layout/nz-sider/div/form/nz-form-item[2]/nz-form-control/div/div/nz-input-group/input
${BTN_LOGIN}    id=tg-login-accept


*** Keywords ***
Login
    [Arguments]    ${USER}    ${PASSWORD}
    wait until element is visible   ${CMP_USUARIO}
    CAPTURE PAGE SCREENSHOT
    input text   ${CMP_USUARIO}      ${USER}
    input text    ${CMP_PASSWORD}     ${PASSWORD}
    wait until element is enabled    ${BTN_LOGIN}
    click element    ${BTN_LOGIN}
    CAPTURE PAGE SCREENSHOT

LogOut
    UnSelect Frame
    Wait Until Element Is Visible    xpath://*[@class="ant-avatar ant-avatar-sm ant-avatar-circle ant-avatar-icon ant-dropdown-trigger"]
    capture page screenshot
    Click Element    xpath://*[@class="ant-avatar ant-avatar-sm ant-avatar-circle ant-avatar-icon ant-dropdown-trigger"]
    Wait Until Element Is Visible    id=logout
    Click Element    id=logout

# KEYWORDS DE EJEPLO
Keyword-Acceso-Empleado
    ${TMP}    Set Variable    temporal en keyword
    Log    En PO Login.resource: ${EMPLEADO}    console=True

Otra Keyword
    Log    ${TMP}    console=True