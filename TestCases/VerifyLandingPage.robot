*** Settings ***
Resource    ../Resources/MainScenarios.robot



Suite Setup   Open and Setup Enviroment
Suite Teardown    close browser




*** Test Cases ***
Landing Page
    #set selenium speed    3
    Verify Handlebanner
    Verify Six Tile Grid
    Verify Inspiroidu Link
    Verify Bottom Three Tile Grid
    Verify S_Etuja Banner
    Verify SelaaKuvastoa Banner
    Verify Suggettion Slider
    Verify Catagory Tiles
    Verify Brand Tiles





