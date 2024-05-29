*** Settings ***
Library             SeleniumLibrary


*** Variables ***
${PROFILE_HEADER_LABEL} =           Profile

*** Keywords ***
Verify Page Loaded
    wait until page contains        ${PROFILE_HEADER_LABEL}