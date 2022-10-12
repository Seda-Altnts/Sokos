*** Settings ***
Library    SeleniumLibrary
Library    RPA.Excel.Files
Library    OperatingSystem
Library    DateTime
Library    String



*** Variables ***
${wait_time_out}   10
${wait_time_out_short}    0.5
${wait_time_out_shortest}    0.001
${wait_time_out_long}   20
${text_element}



*** Keywords ***
Click Element When Visible
        [Arguments]    ${argument_location}
        Get Location And Log
        register keyword to run on failure    NONE
        run keyword and ignore error    wait until element is visible    ${argument_location}    ${wait_time_out}
        run keyword and ignore error    scroll element into view    ${argument_location}
        run keyword and ignore error    mouse over    ${argument_location}
        run keyword and ignore error    set focus to element    ${argument_location}
        register keyword to run on failure    Failure Setup
        ${status}    ${error}     run keyword and ignore error     click element    ${argument_location}
        run keyword if    '${status}'=='FAIL'    Click with Javascript    ${argument_location}

Click Element If Visible
        [Arguments]     ${argument_element}  ${argument_time_out}=${wait_time_out}
        Register Keyword to Run On Failure    NONE
        Set global variable    ${global_element}     ${argument_element}
        Set global variable    ${global_time_out}     ${argument_time_out}
        Set Selenium And Browser Implicit Wait      ${global_time_out}
        ${status}    ${error}    Run Keyword And Ignore Error    Element Should Be Visible   ${argument_element}
        Run Keyword If    '${status}'=='PASS'    Run Keyword And Continue On Failure    Click with JavaScript     ${global_element}
        Register Keyword To Run On Failure      Failure Setup
        Set Selenium And Browser Implicit Wait      ${wait_time_out}

Click Other Element Until Visible
         [Arguments]   ${argumentNotVisible}     ${argumentOtherElement}
         register keyword to run on failure    NONE
         ${status}    ${error}    run keyword and ignore error    element should be visible    ${argumentNotVisible}    ${wait_time_out_shortest}
         run keyword if    '${status}'=='FAIL'    Click with Javascript   ${argumentOtherElement}
         register keyword to run on failure    capture page screenshot

Click with Javascript
        [Arguments]   ${argument_location}
        ${argument_location}    get webelement    ${argument_location}
        execute javascript    arguments[0].click();    ARGUMENTS    ${argument_location}

Set Selenium And Browser Implicit Wait
    [Arguments]    ${argument_wait}
    set selenium implicit wait   ${argument_wait}
    set browser implicit wait    ${argument_wait}


Get Location And Log
    ${current_url}    get location
    set global variable     ${current_url}     ${current_url}
    log     ${current_url}
    log to console    ${current_url}

log to console and report
     [Arguments]   ${argument_log}
     log to console    ${argument_log}
     log    ${argument_log}

