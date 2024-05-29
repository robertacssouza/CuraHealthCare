*** Settings ***
Library             SeleniumLibrary


*** Variables ***
${SIGNIN_HEADER_LABEL} =             Login
${SIGNIN_USERNAME_TEXTBOX} =         id=txt-username
${SIGNIN_PASSWORD_TEXTBOX} =         id=txt-password
${SIGNIN_SUBMIT_BUTTON} =            xpath=//*[@id="btn-login"]
${SIGNIN_WARNING_MESSAGE_LABEL} =    Login failed! Please ensure the username and password are valid.

*** Keywords ***
Verify Page Loaded
    wait until page contains        ${SIGNIN_HEADER_LABEL}

Verify Warning Message   #in the case try to login with invalid credentials
    wait until page contains        ${SIGNIN_WARNING_MESSAGE_LABEL}

Login With Valid Credentials
    [Arguments]   ${Username}      ${Password}
    Fill "Username" Field       ${Username}
    Fill "Password" Field       ${Password}
    Click "Submit" Button

Fill "Username" Field
    [Arguments]   ${Username}
    input text              ${SIGNIN_USERNAME_TEXTBOX}   ${Username}

Fill "Password" Field
    [Arguments]   ${Password}
    input text              ${SIGNIN_PASSWORD_TEXTBOX}     ${Password}

Click "Submit" Button
    click button            ${SIGNIN_SUBMIT_BUTTON}

#############

Login With Incorrect Credentials
    [Arguments]     ${Invalid_Username}      ${Invalid_Password}
    Fill "Invalid Username" Field       ${Invalid_Username}
    Fill "Invalid Password" Field       ${Invalid_Password}
    Click "Submit" Button

Fill "Invalid Username" Field
    [Arguments]   ${Invalid_Username}
    input text              ${SIGNIN_USERNAME_TEXTBOX}   ${Invalid_Username}

Fill "Invalid Password" Field
    [Arguments]   ${Invalid_Password}
    input text              ${SIGNIN_PASSWORD_TEXTBOX}     ${Invalid_Password}

