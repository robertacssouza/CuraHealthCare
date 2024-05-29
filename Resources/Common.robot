*** Settings ***
Library         SeleniumLibrary

*** Variables ***

*** Keywords ***
Begin Web Test
    #set selenium speed       .2s
    set selenium timeout     10s

    open browser            ${START_URL}        ${BROWSER}

    #resize browser window
    #set window position      x=341   y=169
    #set window size          width=1935  height=1090

End Web Test
       close all browsers