*** Settings ***
Resource    ../Resources/Essential.robot
Resource    ../Resources/SetUp&TearDown.robot



*** Keywords ***
Verify Handlebanner
    element should be visible    ${HandleBannerImage}

Verify Six Tile Grid
    element should be visible   ${Second_TileGrid}

    ${GridCount}    get element count    ${Five_TileGrid}
        log to console   These are ${GridCount} tiles on grids

    FOR    ${tile}         IN RANGE    1    ${GridCount}+1
      element should be visible       (${Five_TileGrid})[${tile}]

    END

Verify Inspiroidu Link
    element should be visible   ${InspiroiduLinkText}

Verify Bottom Three Tile Grid
    ${BottomGridCount}    get element count    ${Three_TileGrid}
        log to console   These are ${BottomGridCount} tiles on grids

    FOR    ${tile}         IN RANGE    1    ${BottomGridCount}+1
      element should be visible       (${Three_TileGrid})[${tile}]

    END
Verify S_Etuja Banner
    element should be visible    ${S_EtujaBanner}

Verify SelaaKuvastoa Banner
    element should be visible    ${SelaaKuvastoaBanner}

Verify Suggettion Slider
     ${SliderCount}    get element count    ${SuggestionSliders}
        log to console   There are ${SliderCount} sliders

    FOR    ${slider}         IN RANGE    1    ${SliderCount}+1
       ${ProductCount}    get element count    (${SuggestionSliders})[${slider}]/descendant::*${SuggestionSliderProducts}
       log to console   There are ${ProductCount} products on ${slider} slider
            scroll element into view    (${SuggestionSliders})[${slider}]
            FOR    ${product}         IN RANGE    1    ${ProductCount}+1
                Click Other Element Until Visible    ((${SuggestionSliders})[${slider}]/descendant::*${SuggestionSliderProducts})[${product}]     ((${SuggestionSliders})[${slider}]/descendant::*${Page_LinkNext})
                element should be visible    ((${SuggestionSliders})[${slider}]/descendant::*${SuggestionSliderProducts})[${product}]
            END
    END
Verify Catagory Tiles
     ${FourCatagory}    get element count    ${CatagoryTiles}
        log to console   These are ${FourCatagory} category tiles

    FOR    ${tile}         IN RANGE    1    ${FourCatagory}+1
      element should be visible       (${CatagoryTiles})[${tile}]

    END

Verify Brand Tiles
    element should be visible    ${BrandTiles}


#Kosmetiikka Landing Page
Go to Catagory Landing Page
    [Arguments]    ${CatagoryPage}
    Click Element When Visible  //*[@id='departmentsMenu1']/descendant::*[contains(text(),'${CatagoryPage}')]
    ${h1_header}    get text    //h1
    should be equal as strings    ${h1_header}     ${CatagoryPage}

Verify Content Slider
    element should be visible    ${KosmatiikkaHandleBanner}    ${wait_time_out_long}

Verify Sub-Catagories
    ${CountSubCatagory}    get element count    ${SubCatagories}
        log to console   There are ${CountSubCatagory} sub category.

    FOR    ${subCatagory}         IN RANGE    1    ${CountSubCatagory}+1
      set focus to element     (${SubCatagories})[${subCatagory}]
      element should be visible       (${SubCatagories})[${subCatagory}]
      END

Verify Brands Content
    ${CountOfBrands}    get element count    ${BrandContent}
        log to console   There are ${CountOfBrands} brands

    FOR    ${brand}         IN RANGE    1    ${CountOfBrands}+1
      set focus to element     (${BrandContent})[${brand}]
      element should be visible       (${BrandContent})[${brand}]
      END

Verify Product Suggestion Sliders
      ${SliderCount}    get element count    ${SuggestionSliders}
        log to console   There are ${SliderCount} sliders

    FOR    ${slider}         IN RANGE    1    ${SliderCount}+1
       ${ProductCount}    get element count    (${SuggestionSliders})[${slider}]/descendant::*${SuggestionSliderProducts}
       log to console   There are ${ProductCount} products on ${slider} slider
            scroll element into view    (${SuggestionSliders})[${slider}]
            FOR    ${product}         IN RANGE    1    ${ProductCount}+1
                Click Other Element Until Visible    ((${SuggestionSliders})[${slider}]/descendant::*${SuggestionSliderProducts})[${product}]     ((${SuggestionSliders})[${slider}]/descendant::*${Page_LinkNext})
                scroll element into view     ((${SuggestionSliders})[${slider}]/descendant::*${SuggestionSliderProducts})[${product}]
                set focus to element    ((${SuggestionSliders})[${slider}]/descendant::*${SuggestionSliderProducts})[${product}]
                element should be visible    ((${SuggestionSliders})[${slider}]/descendant::*${SuggestionSliderProducts})[${product}]
            END
    END


Verify Current Product List Container
       page should contain element    ${ProductListGrid}
       scroll element into view   ${ProductListGrid}
       ${ProductCount}    get element count    ${CurrentProductList}
       log to console   There are ${ProductCount} products on list.
            FOR    ${product}         IN RANGE    1    ${ProductCount}+1
                scroll element into view     (${CurrentProductList})[${product}]
                set focus to element    (${CurrentProductList})[${product}]
                element should be visible   (${CurrentProductList})[${product}]
                element should be visible    ((${CurrentProductList})[${product}]/descendant::*/img)[1]
                set focus to element        (${CurrentProductList})[${product}]/descendant::*[@class='product_name']
                element should be visible    (${CurrentProductList})[${product}]/descendant::*[@class='product_name']

            END





