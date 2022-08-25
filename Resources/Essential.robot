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
        click element    ${argument_location}

