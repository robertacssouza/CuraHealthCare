*** Settings ***
Library             SeleniumLibrary


*** Variables ***
${HISTORY_HEADER_LABEL} =           History

*** Keywords ***
Verify Page Loaded
    wait until page contains        ${HISTORY_HEADER_LABEL}
