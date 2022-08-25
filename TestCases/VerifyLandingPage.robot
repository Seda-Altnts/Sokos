*** Settings ***
Resource    ../Resources/MainScenarios.robot


Suite Setup   Open and Setup Enviroment
Suite Teardown    close browser




*** Test Cases ***
Landing Page
    Verify Handlebanner
    sleep    5



