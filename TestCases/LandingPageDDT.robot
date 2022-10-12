*** Settings ***
Resource    ../Resources/MainScenarios.robot
Library    DataDriver    ../TestData/SokosTabMenu.xlsx     Sheet_name=Sheet1


Suite Setup   Open and Setup Enviroment
Suite Teardown    close browser
Test Template     Menu Landing Page




*** Test Cases ***
All Menu Landing Page ${category}    ${category}

*** Keywords ***
Menu Landing Page
    [Arguments]    ${category}
    [Tags]     regression
    Go to Catagory Landing Page     ${category}
    Verify Handlebanner
    Verify Six Tile Grid
    Verify Inspiroidu Link
    Verify Bottom Three Tile Grid
    Verify S_Etuja Banner
    Verify SelaaKuvastoa Banner
    Verify Suggettion Slider
    Verify Catagory Tiles
    Verify Brand Tiles
    Verify Product Suggestion Sliders
    Verify Current Product List Container

#pabot --testlevelsplit --pabLandingPageDDT.robototlib  --processes 5 --outputdir TestResults/LandingPageDDT  TestCases/LandingPageDDT.robot