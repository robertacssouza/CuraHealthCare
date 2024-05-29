*** Settings ***
Documentation       This is some basic info about the whole suite
Library             SeleniumLibrary
Library             DateTime
Resource            ../Resources/Common.robot
Resource            ../Resources/CuraApp.robot
Test Setup          Common.Begin Web Test
Test Teardown       Common.End Web Test

#Run the script
#robot -d Results Tests/Cura.robot
#robot -d results -i TC001 Tests/Cura.robot
*** Variables ***
${BROWSER} =                chrome
${START_URL} =              https://katalon-demo-cura.herokuapp.com/
${VALID_LOGIN_USERNAME} =   John Doe
${VALID_LOGIN_PASSWORD} =   ThisIsNotAPassword
${INVALID_LOGIN_USERNAME} =
${INVALID_LOGIN_PASSWORD} =
${Date} =                   29/05/2020
${Comment_text} =           I have an appointment

*** Test Cases ***

Try to log in with incorrect credentials
    [Documentation]          This is some basic info about the test
    [Tags]                   TC001    Smoke
    CuraApp.Go to "Home" Page
    CuraApp.Navegate to the "SignIn" page
    CuraApp.Login With Incorrect Credentials            ${INVALID_LOGIN_USERNAME}     ${INVALID_LOGIN_PASSWORD}


Should be able to login with valid credentials
    [Documentation]          This is some basic info about the test
    [Tags]                   TC002    Smoke
    CuraApp.Go to "Home" Page
    CuraApp.Navegate to the "SignIn" page
    CuraApp.Login With Valid Credentials            ${VALID_LOGIN_USERNAME}     ${VALID_LOGIN_PASSWORD}

Should be able to make an appointment
    [Documentation]          This is some basic info about the test
    [Tags]                   TC003    Smoke
    CuraApp.Go to "Home" Page
    CuraApp.Navegate to the "SignIn" page
    CuraApp.Login With Valid Credentials             ${VALID_LOGIN_USERNAME}     ${VALID_LOGIN_PASSWORD}
    CuraApp.Filling the form
    CuraApp.Select Date                              ${Date}
    CuraApp.Leaving a message in "comment" box       ${Comment_text}
    CuraApp.Clicking on the button to book an appointment

Should be able to view the appointments scheduled history
    [Documentation]          This is some basic info about the test
    [Tags]                   TC004    Smoke
    CuraApp.Go to "Home" Page
    CuraApp.Navegate to the "SignIn" page
    CuraApp.Login With Valid Credentials            ${VALID_LOGIN_USERNAME}     ${VALID_LOGIN_PASSWORD}
    CuraApp.Navegate to "History" page

Should be able to view the profile
    [Documentation]          This is some basic info about the test
    [Tags]                   TC005    Smoke
    CuraApp.Go to "Home" Page
    CuraApp.Navegate to the "SignIn" page
    CuraApp.Login With Valid Credentials            ${VALID_LOGIN_USERNAME}     ${VALID_LOGIN_PASSWORD}
    CuraApp.Navegate to "Profile" page


