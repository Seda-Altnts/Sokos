*** Settings ***
Resource    ../Resources/Essential.robot
Variables    ../Resources/Locators.py




*** Variables ***
${Browser}      chrome
${Url}          https://www.sokos.fi/fi/sokos
${test_result_dir}
${nameCategory}
${ProductURL}
${ProductID}
${current_url}


*** Keywords ***
Open and Setup Enviroment
    open browser    ${Url}    ${Browser}
    maximize browser window
    register keyword to run on failure    Failure Setup
    Accept Cookies




Accept Cookies
    click element when visible    ${AcceptCookies}

Failure Setup
    get location and log
    Setup Test Output
    Excel Report Setup


Setup Test Output
    ${executionDate}    get current date     result_format=%Y %m %d
    ${status_file}  ${error}  run keyword and ignore error        directory should exist      TestResults/${SUITE_NAME}/${TEST_NAME}/${executionDate}
    run keyword if    '${status_file}'=='FAIL'    set global variable    ${test_result_dir}     TestResults/${SUITE_NAME}/${TEST_NAME}/${executionDate}
    run keyword if    '${status_file}'=='FAIL'    create directory     ${test_result_dir}
    run keyword if    '${status_file}'=='FAIL'    set screenshot directory    ${test_result_dir}/SS
    ${status_file}  ${error}  run keyword and ignore error        file should exist       ${test_result_dir}/Excel_Report.xlsx
    run keyword if    '${status_file}'=='FAIL'    Create Workbook      ${test_result_dir}/Excel_Report.xlsx   xlsx
    run keyword if    '${status_file}'=='FAIL'   Set Cell Value    1    A    F.no
    run keyword if    '${status_file}'=='FAIL'   Set Cell Value    1    B    Time
    run keyword if    '${status_file}'=='FAIL'   Set Cell Value    1    C    URL
    run keyword if    '${status_file}'=='FAIL'   Set Cell Value    1    D    Product Id
    run keyword if    '${status_file}'=='FAIL'   Set Cell Value    1    E    Product URL
    run keyword if    '${status_file}'=='FAIL'   Set Cell Value    1    F    Category
    run keyword if    '${status_file}'=='FAIL'   Set Cell Value    1    G    Screenshot
    run keyword if    '${status_file}'=='FAIL'     Save Workbook


Excel Report Setup
    open workbook    ${test_result_dir}/Excel_Report.xlsx
    ${next}    Find Empty Row
    ${failureNo}    evaluate    ${next}-1
    capture page screenshot    selenium-screenshot-${failureNo}.png
    ${timeSlot}    get current date
    Set Cell Value    ${next}    A   ${failureNo}
    Set Cell Value    ${next}    B   ${timeSlot}
    Set Cell Value    ${next}    C   ${current_url}
    Set Cell Value    ${next}    D   ${ProductID}
    Set Cell Value    ${next}    E   ${ProductURL}
    Set Cell Value    ${next}    F   ${nameCategory}
    Insert image to worksheet    ${next}    G    ${test_result_dir}/SS/selenium-screenshot-${failureNo}.png    0.2
    Save Workbook


