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
    Click Element When Visible  //*[@id='departmentsMenu1']/descendant::*[contains(text(),'${CatagoryPage}')]/..
    wait until page contains element    //h1
    ${h1_header}    get text    //h1
    should be equal as strings    ${h1_header}     ${CatagoryPage}

Verify Content Slider
    element should be visible    ${CarouselInner}    ${wait_time_out_long}

Verify Sub-Catagories
    ${CountSubCatagory}    get element count    ${SubCategories}
        log to console   There are ${CountSubCatagory} sub category.

    FOR    ${subCatagory}         IN RANGE    1    ${CountSubCatagory}+1
      set focus to element     (${SubCategories})[${subCatagory}]
      element should be visible       (${SubCategories})[${subCatagory}]
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
       run keyword and continue on failure    page should contain element    ${ProductListGrid}    ${wait_time_out}
       ${ProductCount}    get element count    ${CurrentProductList}
       set global variable    ${PreviousPLPAmount}     ${ProductCount}
       log to console   There are ${ProductCount} products on list.
            FOR    ${product}         IN RANGE    1    ${ProductCount}+1
                ${ProductID}    get element attribute    (${CurrentProductList})[${product}]    data-productid
                ${ProductURL}     get element attribute    ((${CurrentProductList})[${product}])${hrefAtribute}    href
                set global variable    ${ProductID}    ${ProductID}
                set global variable    ${ProductURL}    ${ProductURL}
                log to console and report    [${product}] - ${ProductID}: ${ProductURL}
                run keyword and continue on failure     element should be visible    ((${CurrentProductList})[${product}]/descendant::*/img)[1]
                run keyword and continue on failure     set focus to element        (${CurrentProductList})[${product}]/descendant::*${ProductName}
                run keyword and continue on failure     scroll element into view     (${CurrentProductList})[${product}]/descendant::*${ProductName}
                run keyword and continue on failure     element should be visible    (${CurrentProductList})[${product}]/descendant::*${ProductName}
                run keyword and continue on failure     element should be visible    (${CurrentProductList})[${product}]/descendant::*${FavProductIcon}
                run keyword and continue on failure     element should be visible    (${CurrentProductList})[${product}]/descendant::*${ProductPrice}
                set global variable    ${ProductID}    ${empty}
                set global variable    ${ProductURL}    ${empty}
            END

Select Random Among
    [Arguments]   ${argument_name}  ${argument_location}
    register keyword to run on failure    NONE
    run keyword and ignore error    wait until page contains element    ${argument_location}    40
    register keyword to run on failure    Failure Setup
    ${CountArgument}    get element count    ${argument_location}
    IF    ${CountArgument} > 0
        ${randomArgument}     Evaluate  random.randint(1, ${CountArgument})
        Click Element When Visible    (${argument_location})[${randomArgument}]
        ${selected_random_name}    get text    (${argument_location})[${randomArgument}]
        set global variable     ${selected_random_name}     ${selected_random_name}
        log to console    Selected ${selected_random_name} amongs ${CountArgument} ${argument_name} options
    END

Verify All Products of Current Category
    Get Location And Log
    ${PageCount}   get element count    ${CountPLP}
    run keyword if    ${PageCount}==0    Verify Current Product List Container
    FOR    ${page}         IN RANGE    1    ${PageCount}+1
        Verify Current Product List Container
        exit for loop if    ${page}==${PageCount}
        Click Element When Visible    ${Page_LinkNext}
    END

Verify Price Filter
        Verify Random Low Price
        Verify Random High Price

Verify Random Low Price

     ${randomMinPrice}    Set Random Price    ${LowPriceInput}
     Sleep    3
     ${ProductCount}    get element count    ${CurrentProductList}
       log to console   There are ${ProductCount} products on list.
       Get Location And Log
       FOR    ${product}         IN RANGE    1    ${ProductCount}+1
                ${ProductID}    get element attribute    (${CurrentProductList})[${product}]    data-productid
                ${ProductURL}     get element attribute    ((${CurrentProductList})[${product}])${hrefAtribute}    href
                set global variable    ${ProductID}    ${ProductID}
                set global variable    ${ProductURL}    ${ProductURL}
                ${price}     get text    (${CurrentProductList})[${product}]/descendant::*${ProductPrice}
                ${price}     remove string    ${SPACE}
                log to console and report    [${product}] - ${ProductID} - ${price}: ${ProductURL}
        END
     click element when visible   ${ClearFilter}

Verify Random High Price
     ${randomMaxPrice}    Set Random Price    ${HighPriceInput}
     Sleep    3
     ${ProductCount}    get element count    ${CurrentProductList}
       log to console   There are ${ProductCount} products on list.
       Get Location And Log
       FOR    ${product}         IN RANGE    1    ${ProductCount}+1
                ${ProductID}    get element attribute    (${CurrentProductList})[${product}]    data-productid
                ${ProductURL}     get element attribute    ((${CurrentProductList})[${product}])${hrefAtribute}    href
                set global variable    ${ProductID}    ${ProductID}
                set global variable    ${ProductURL}    ${ProductURL}
                ${price}     get text    (${CurrentProductList})[${product}]/descendant::*${ProductPrice}
                ${price}     remove string    ${SPACE}
                log to console and report    [${product}] - ${ProductID} - ${price}: ${ProductURL}
        END
    click element when visible   ${ClearFilter}

Set Random Price
     [Arguments]    ${argument_location}
     Click Element When Visible     ${FilterOfHinta}
     ${randomPrice}     Evaluate  random.randint(1, 100)
     press keys    ${argument_location}    ARROW_LEFT    ARROW_LEFT    ARROW_LEFT    DELETE    DELETE    DELETE    DELETE    ${randomPrice}
     Click Element When Visible     ${ApplyPriceFilter}
     [Return]    ${randomPrice}



Verify Rondom Color
     ${status}    ${error}  run keyword and ignore error    element should be visible    ${ColorFilter}    ${wait_time_out_long}
     IF    '${status}'=='PASS'
         Click Element If Visible     ${ColorFilter}
         #sleep    1
         Click Element If Visible       ${MoreOption}   1
         sleep    3
         get location and log
         ${CountArgument}    get element count    ${ColorOption}
         IF    ${CountArgument} > 0
            Sleep    5
            ${randomArgument}     Evaluate  random.randint(1, ${CountArgument})
            ${color_filter_amount}    get webelement    (//*[@id='Väri']/descendant::*//*[@class='facetCountContainer']/*)[${randomArgument}]
            ${color_filter_amount}    get text    ${color_filter_amount}
            ${color_filter_amount_int}    Convert To Integer     ${color_filter_amount}
            Click Element When Visible    (${ColorOption})[${randomArgument}]
            Click Element When Visible     ${FilterApply}
            Sleep    3
            Verify Current Product List Container
            run keyword and continue on failure     should be equal    ${color_filter_amount_int}     ${PreviousPLPAmount}
            click element when visible   ${ClearFilter}
         END
     END





