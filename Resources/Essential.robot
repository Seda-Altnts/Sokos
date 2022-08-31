*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${wait_time_out}   10
${wait_time_out_short}    0.5
${wait_time_out_shortest}    0.001
${wait_time_out_long}   20
${text_element}



*** Keywords ***
Click Element When Visible
        [Arguments]    ${argument_location}
        wait until element is visible    ${argument_location}    ${wait_time_out}
        scroll element into view    ${argument_location}
        click element    ${argument_location}

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