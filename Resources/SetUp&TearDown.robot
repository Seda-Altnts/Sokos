*** Settings ***
Resource    ../Resources/Essential.robot
Variables    ../Resources/Locators.py




*** Variables ***
${Browser}      Chrome
${Url}          https://www.sokos.fi/fi/sokos


*** Keywords ***
Open and Setup Enviroment
        open browser    ${Url}    ${Browser}
        maximize browser window
        Accept Cookies


Accept Cookies
        click element when visible    ${AcceptCookies}

