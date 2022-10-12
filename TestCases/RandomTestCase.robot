*** Settings ***
Resource    ../Resources/MainScenarios.robot



Suite Setup   Open and Setup Enviroment
Suite Teardown    close browser




*** Test Cases ***
Random Case
    Select Random Among    Categories     ${Categories}
    set global variable     ${nameCategory}    ${selected_random_name}
    Select Random Among    SubCategories    ${SubCategories}
    Select Random Among    3Level_SubCategories    ${SubCategories}
    Verify All Products of Current Category


Verify Random Product Price
     Select Random Among    Categories     ${Categories}
     set global variable     ${nameCategory}    ${selected_random_name}
     Select Random Among    SubCategories    ${SubCategories}
     Select Random Among    3Level_SubCategories    ${SubCategories}
     Verify Price Filter

Verify Product Color Filter
     Select Random Among    Naiset      ${Categories}
     set global variable     ${nameCategory}    ${selected_random_name}
     Select Random Among    SubCategories    ${SubCategories}
     #Select Random Among    3Level_SubCategories    ${SubCategories}
     Verify Rondom Color






