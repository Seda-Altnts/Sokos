*** Settings ***
Resource    ../Resources/MainScenarios.robot
Library    DataDriver    ../TestData/SubCategories.xlsx     sheet_name=Miehet

Suite Setup   Open and Setup Enviroment
Suite Teardown    close browser
Test Template     Menu Landing Page


*** Test Cases ***
All Menu Landing Page ${nameSubCategory}   ${urlSubCategory}

*** Keywords ***
Menu Landing Page
    [Arguments]    ${urlSubCategory}
    [Tags]     regression
    Go to     ${urlSubCategory}
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

#pabot --testlevelsplit --pabotlib  --processes 12 --outputdir TestResults/LandingPageDDT  TestCases/LandingPageSubDDT.robot