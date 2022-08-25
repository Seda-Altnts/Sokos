*** Settings ***
Resource    ../Resources/Essential.robot
Resource    ../Resources/SetUp&TearDown.robot



*** Keywords ***
Verify Handlebanner
    element should be visible    ${HandleBannerImage}




