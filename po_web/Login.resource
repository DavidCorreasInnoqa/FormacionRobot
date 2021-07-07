*** Settings ***
Library    SeleniumLibrary


*** Variables ***


*** Keywords ***
Login
    wait until element is visible   xpath://html/body/app-root/app-auth/nz-layout/nz-sider/div/form/nz-form-item[1]/nz-form-control/div/div/nz-input-group/input
    CAPTURE PAGE SCREENSHOT
    input text    xpath://html/body/app-root/app-auth/nz-layout/nz-sider/div/form/nz-form-item[1]/nz-form-control/div/div/nz-input-group/input     coper
    input text    xpath://html/body/app-root/app-auth/nz-layout/nz-sider/div/form/nz-form-item[2]/nz-form-control/div/div/nz-input-group/input     coper1234
    wait until element is enabled    id=tg-login-accept
    click element    id=tg-login-accept
    CAPTURE PAGE SCREENSHOT

LogOut
    UnSelect Frame
    Wait Until Element Is Visible    xpath://*[@class="ant-avatar ant-avatar-sm ant-avatar-circle ant-avatar-icon ant-dropdown-trigger"]
    capture page screenshot
    Click Element    xpath://*[@class="ant-avatar ant-avatar-sm ant-avatar-circle ant-avatar-icon ant-dropdown-trigger"]
    Wait Until Element Is Visible    id=logout
    Click Element    id=logout
