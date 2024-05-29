*** Settings ***
Library             SeleniumLibrary
Library             DateTime

*** Variables ***
${MAKEAPPOINTMENT_HEADER_LABEL} =                       Make Appointment
${MAKEAPPOINTMENT_FACILITY_DROPDOWN}                    facility
${MAKEAPPOINTMENT_DROPDOWN_LABEL_TOKIO} =               Tokyo CURA Healthcare Center
${MAKEAPPOINTMENT_DROPDOWN_LABEL_HONGKONG} =            Hongkong CURA Healthcare Center
${MAKEAPPOINTMENT_DROPDOWN_LABEL_SEOUL} =               Seoul CURA Healthcare Center
${MAKEAPPOINTMENT_READMISSION_CHECKBOX} =               id=chk_hospotal_readmission
${MAKEAPPOINTMENT_NAME_RADIO_BUTTONS} =                 programs
${MAKEAPPOINTMENT_MEDICARE_RADIO} =                     Medicare
${MAKEAPPOINTMENT_MEDICAID_RADIO} =                     Medicaid
${MAKEAPPOINTMENT_NONE_RADIO} =                         None
${MAKEAPPOINTMENT_BOX_INPUT_DATE} =                     xpath=//*[@class="input-group date"]
${MAKEAPPOINTMENT_CALENDAR} =                           xpath=/html/body/div
${MAKEAPPOINTMENT_BACK_MONTH_BUTTON} =                  xpath=/html/body/div/div[1]/table/thead/tr[2]/th[1]
${MAKEAPPOINTMENT_NEXT_MONTH_BUTTON} =                  xpath=/html/body/div/div[1]/table/thead/tr[2]/th[3]
${MAKEAPPOINTMENT_DATEPICKER_ELEMENT} =                 id=txt_visit_date
${MAKEAPPOINTMENT_COMMENT_BOX} =                        id=txt_comment
${MAKEAPPOINTMENT_BOOK_APPOINTMENT_BUTTON} =            id=btn-book-appointment
${MAKEAPPOINTMENT_CONFIRMATION} =                       Appointment Confirmation
*** Keywords ***
Verify Page Loaded
    wait until page contains        ${MAKEAPPOINTMENT_HEADER_LABEL}

Select "Tokio" in "Facility" Dropdown
    select from list by label       ${MAKEAPPOINTMENT_FACILITY_DROPDOWN}        ${MAKEAPPOINTMENT_DROPDOWN_LABEL_TOKIO}

Select "Hongkong" in "Facility" Dropdown
    select from list by label       ${MAKEAPPOINTMENT_FACILITY_DROPDOWN}        ${MAKEAPPOINTMENT_DROPDOWN_LABEL_HONGKONG}

Select "Seoul" in "Facility" Dropdown
    select from list by label       ${MAKEAPPOINTMENT_FACILITY_DROPDOWN}        ${MAKEAPPOINTMENT_DROPDOWN_LABEL_SEOUL}

Selecting "Readmission" Checkbox
    select checkbox                 ${MAKEAPPOINTMENT_READMISSION_CHECKBOX}

Checking "Medicare" Radio Button
    select radio button             ${MAKEAPPOINTMENT_NAME_RADIO_BUTTONS}        ${MAKEAPPOINTMENT_MEDICARE_RADIO}

Checking "Medicaid" Radio Button
    select radio button            ${MAKEAPPOINTMENT_NAME_RADIO_BUTTONS}         ${MAKEAPPOINTMENT_MEDICAID_RADIO}

Checking "None" Radio Button
    select radio button            ${MAKEAPPOINTMENT_NAME_RADIO_BUTTONS}        ${MAKEAPPOINTMENT_NONE_RADIO}

############################
Click "Visit Date" Calendar
    click element                       ${MAKEAPPOINTMENT_BOX_INPUT_DATE}
    wait until element is visible       ${MAKEAPPOINTMENT_CALENDAR}

Click Back Month
    wait until element is visible       ${MAKEAPPOINTMENT_CALENDAR}
    click element                       ${MAKEAPPOINTMENT_BACK_MONTH_BUTTON}

Click Next Month
    wait until element is visible       ${MAKEAPPOINTMENT_CALENDAR}
    click element                       ${MAKEAPPOINTMENT_NEXT_MONTH_BUTTON}

Click "DatePicker"
    [Arguments]   ${Date}
    click element                        ${MAKEAPPOINTMENT_DATEPICKER_ELEMENT}
    wait until element is visible        ${MAKEAPPOINTMENT_CALENDAR}
    Fill "DatePiker" Field               ${Date}

Fill "DatePiker" Field
    [Arguments]   ${Date}
    input text                           ${MAKEAPPOINTMENT_DATEPICKER_ELEMENT}         ${Date}

Click "Comment" box
    [Arguments]   ${Comment_text}
    click element                        ${MAKEAPPOINTMENT_COMMENT_BOX}
    Fill "Comment" Field                 ${Comment_text}

Fill "Comment" Field
    [Arguments]   ${Comment_text}
    input text                           ${MAKEAPPOINTMENT_COMMENT_BOX}         ${Comment_text}

Click "Book Appointment" Button
    click button                        ${MAKEAPPOINTMENT_BOOK_APPOINTMENT_BUTTON}
    wait until page contains            ${MAKEAPPOINTMENT_CONFIRMATION}

