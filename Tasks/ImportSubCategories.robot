*** Settings ***
Resource    ../Resources/MainScenarios.robot



Suite Setup   Open and Setup Enviroment
Suite Teardown    close browser

*** Variables ***
${nameSubCategory}
${urlSubCategory}
${nameSub-SubCategory}
${urlSub-SubCategory}

*** Tasks ***
Import Sub Categories to Excel
    #Get SubCategories and Import Excel
    Get Sub-SubCategories and Import Excel

*** Keywords ***

Get SubCategories and Import Excel
   Create Workbook      TestData/SubCategories.xlsx   xlsx     All
   Set Cell Value    1    A    \${nameSubCategory}
   Set Cell Value    1    B    \${urlSubCategory}
   ${CountMainCategory}  get element count    ${CategoriesMegamenu}
   FOR    ${Category}      IN RANGE    1    ${CountMainCategory}+1
        Sleep    3
        ${CountSubCategory}  get element count      (//*[@data-parent='departmentsMenu'][${Category}])/descendant::*[@class='js-sub-category']/*
        Sleep    3
        ${CategoryId}     get element attribute    (//*[@data-parent='departmentsMenu'][${Category}])    data-id
        mouse over   ${Categories}/*[contains(@data-menu-id,'${CategoryId}')]
        ${nameCategory}    get element attribute    (//*[@data-parent='departmentsMenu'][${Category}])    aria-label
        create worksheet    ${nameCategory}
        Set Cell Value    1    A    \${nameSubCategory}
        Set Cell Value    1    B    \${urlSubCategory}
            FOR    ${Sub_Category}      IN RANGE    1    ${CountSubCategory} +1
                   set active worksheet    ${nameCategory}
                   ${nameSubCategory}    get text    (//*[@data-parent='departmentsMenu'][${Category}])/descendant::*[@class='js-sub-category'][${Sub_Category}]/*
                   ${urlSubCategory}    get element attribute    (//*[@data-parent='departmentsMenu'][${Category}])/descendant::*[@class='js-sub-category'][${Sub_Category}]/*    href
                   ${next}    Find Empty Row
                   Set Cell Value    ${next}    A    ${nameSubCategory}
                   Set Cell Value    ${next}    B    ${urlSubCategory}
                   save workbook
                   set active worksheet    All
                   ${next}    Find Empty Row
                   Set Cell Value    ${next}    A    ${nameSubCategory}
                   Set Cell Value    ${next}    B    ${urlSubCategory}
                   save workbook
            END

    END



Get Sub-SubCategories and Import Excel
   Create Workbook      TestData/Sub-SubCategories.xlsx   xlsx     All
   Set Cell Value    1    A    \${nameSub-SubCategory}
   Set Cell Value    1    B    \${urlSub-SubCategory}
   ${CountMainCategory}  get element count    ${CategoriesMegamenu}
   FOR    ${Category}      IN RANGE    1    ${CountMainCategory}+1
        Sleep    3
        ${CountSubCategory}  get element count      (//*[@data-parent='departmentsMenu'][${Category}])/descendant::*[@class='js-sub-category']/*
        Sleep    3
        ${CategoryId}     get element attribute    (//*[@data-parent='departmentsMenu'][${Category}])    data-id
        mouse over   ${Categories}/*[contains(@data-menu-id,'${CategoryId}')]
        ${nameCategory}    get element attribute    (//*[@data-parent='departmentsMenu'][${Category}])    aria-label
        create worksheet    ${nameCategory}
        Set Cell Value    1    A    \${nameSubCategory}
        Set Cell Value    1    B    \${urlSubCategory}
            FOR    ${Sub_Category}      IN RANGE    1    ${CountSubCategory}+1
                 ${CountSub_SubCategory}  get element count     (//*[@data-parent='departmentsMenu'][${Category}])/descendant::*[@class='sub-category-block'][${Sub_Category}]/descendant::*[@class='menuLink text-large']
                   FOR    ${Sub_SubCategory}      IN RANGE    1    ${CountSub_SubCategory}+1
                       set active worksheet    ${nameCategory}
                       ${nameSubCategory}    get text    (//*[@data-parent='departmentsMenu'][${Category}])/descendant::*[@class='sub-category-block'][${Sub_Category}]/descendant::*[@class='menuLink text-large'][${CountSub_SubCategory}]
                       ${urlSubCategory}    get element attribute    (//*[@data-parent='departmentsMenu'][${Category}])/descendant::*[@class='sub-category-block'][${Sub_Category}]/descendant::*[@class='menuLink text-large'][${CountSub_SubCategory}]   href
                       ${next}    Find Empty Row
                       Set Cell Value    ${next}    A    ${nameSubCategory}
                       Set Cell Value    ${next}    B    ${urlSubCategory}
                       save workbook
                       set active worksheet    All
                       ${next}    Find Empty Row
                       Set Cell Value    ${next}    A    ${nameSubCategory}
                       Set Cell Value    ${next}    B    ${urlSubCategory}
                       save workbook
                   END

            END

    END