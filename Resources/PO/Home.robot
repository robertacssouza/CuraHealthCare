*** Settings ***
Library             SeleniumLibrary


*** Variables ***
${HOME_HEADER_LABEL} =        xpath=//div[@class="text-vertical-center"]/h1
${HOME_BUTTON} =              id=btn-make-appointment
${HOME_SIDEBAR_BUTTON} =      id=menu-toggle

*** Keywords ***
Load
    Go to        ${START_URL}

Verify Page Loaded
    page should contain element     ${HOME_HEADER_LABEL}
    page should contain link        ${HOME_BUTTON}
    page should contain element     ${HOME_SIDEBAR_BUTTON}
