*** Settings ***
Resource    ../Resources/Essential.robot
Variables    ../Resources/Locators.py




*** Variables ***
${Browser}      headlesschrome
${Url}          https://www.sokos.fi/fi/sokos


*** Keywords ***
Open and Setup Enviroment
        open browser    ${Url}    ${Browser}
        maximize browser window
        register keyword to run on failure    Failure Setup
        Accept Cookies


Accept Cookies
        click element when visible    ${AcceptCookies}

Failure Setup
    get location and log
    capture page screenshot