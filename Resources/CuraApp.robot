*** Settings ***
Resource        ../Resources/PO/History.robot
Resource        ../Resources/PO/Home.robot
Resource        ../Resources/PO/LoggedOut.robot
Resource        ../Resources/PO/MakeAppointment.robot
Resource        ../Resources/PO/Profile.robot
Resource        ../Resources/PO/SideBar.robot
Resource        ../Resources/PO/SignIn.robot


*** Variables ***




*** Keywords ***
Go to "Home" Page
    Home.Load
    Home.Verify Page Loaded

Navegate to the "SignIn" page
    SideBar.Click Sidebar Button
    SideBar.Click Login Link
    SignIn.Verify Page Loaded

Navegate to "History" page
    SideBar.Click Sidebar Button
    SideBar.Click History Link
    History.Verify Page Loaded

Navegate to "Profile" page
    SideBar.Click Sidebar Button
    SideBar.Click History Link
    Profile.Verify Page Loaded

Login With Valid Credentials
    [Arguments]   ${Username}      ${Password}
    SignIn.Login With Valid Credentials     ${Username}      ${Password}

Login With Incorrect Credentials
    [Arguments]   ${Invalid_Username}      ${Invalid_Password}
    SignIn.Login With Incorrect Credentials     ${Invalid_Username}      ${Invalid_Password}
    SignIn.Verify Warning Message

Filling the form
    MakeAppointment.Verify Page Loaded
    MakeAppointment.Select "Seoul" in "Facility" Dropdown
    MakeAppointment.Selecting "Readmission" Checkbox
    MakeAppointment.Checking "Medicaid" Radio Button

Select Date
    [Arguments]   ${Date}
    MakeAppointment.Click "Visit Date" Calendar
    MakeAppointment.Click "DatePicker"          ${Date}
    sleep               1
    MakeAppointment.Fill "DatePiker" Field      ${Date}
    sleep               1

Leaving a message in "comment" box
    [Arguments]   ${Comment_text}
    MakeAppointment.Click "Comment" box         ${Comment_text}
    sleep               1
    MakeAppointment.Fill "Comment" Field        ${Comment_text}
    sleep               1

Clicking on the button to book an appointment
    MakeAppointment.Click "Book Appointment" Button
    sleep               1


  #  Customers.Click Add Customer Link
  #  AddCustomer.Verify Page Loaded
 #   AddCustomer.Add New Customer
 #   Customers.Verify Customer Added Successfully

#Sign Out
 #   TopNav.Click "Sign Out" Link
 #   LoggedOut.Verify Page Loaded