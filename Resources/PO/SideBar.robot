*** Settings ***
Library             SeleniumLibrary


*** Variables ***
${SIDEBAR_BUTTON} =                   id=menu-toggle
${SIDEBAR_MENU_OPTION} =              xpath=//*[@id="sidebar-wrapper"]
${SIDEBAR_LOGIN_LINK} =               xpath=//*[@id="sidebar-wrapper"]/ul/li[3]/a
${SIDEBAR_HOME_LINK} =                xpath=//*[@id="sidebar-wrapper"]/ul/li[2]/a
${SIDEBAR_HISTORY_LINK} =             xpath=//*[@id="sidebar-wrapper"]/ul/li[3]/a
${SIDEBAR_PROFILE_LINK} =             xpath=//*[@id="sidebar-wrapper"]/ul/li[4]/a
${SIDEBAR_LOGOUT_LINK} =              xpath=//*[@id="sidebar-wrapper"]/ul/li[5]/a
${SIDEBAR_CLOSE_BUTTON} =              id=menu-close
*** Keywords ***
Click Sidebar Button
   Click Element                       ${SIDEBAR_BUTTON}
   Wait Until Page Contains Element    ${SIDEBAR_MENU_OPTION}    timeout=3s

Close Sidebar Button
    Click Element                      ${SIDEBAR_CLOSE_BUTTON}

Click Login Link
   Click Element                       ${SIDEBAR_LOGIN_LINK}

Click Home Link
    Click Element                      ${SIDEBAR_HOME_LINK}

Click History Link
    Click Element                      ${SIDEBAR_HISTORY_LINK}

Click Profile Link
    Click Element                      ${SIDEBAR_PROFILE_LINK}

Click LogOut Link
    Click Element                      ${SIDEBAR_LOGOUT_LINK}
