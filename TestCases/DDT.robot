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
    Verify Content Slider
    Verify Sub-Catagories
    Verify Brands Content
    Verify Product Suggestion Sliders
    Verify Current Product List Container

# pabot --testlevelsplit --pabotlib  --processes 5 --outputdir Results TestCases/DDT.robot