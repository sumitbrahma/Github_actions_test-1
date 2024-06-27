*** Settings ***
Library   AppiumLibrary
Library    OperatingSystem
Resource    ../../../../../CommonBase/Utilities/user_keywords.py
Resource    ../../Resources/Login/login_keywords.robot
Resource    ../../Resources/FLRP/flrp_keywords.robot
Resource    ../../Resources/Fixtures/fixtures_keywords.robot

Test Setup        Open KC application
Test Teardown    Close Application

*** Variables ***
${testdata}    ${CURDIR}${/}..${/}..${/}TestData${/}fixtures_testdata.xlsx

*** Test Cases ***
Verify the functionality if add to calender button on homecsreen fixtures widget
    &{data}    fetch data by id    ${testdata}    1
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_number}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Click On Skip Button If Visible
    Click On Add To Calender On Home Screen
    Verify Add To Calender Functionality    ${data.email}    ${data.password}

Verify the functionality of sync calender functuionality on webview screen
    &{data}    fetch data by id    ${testdata}    2
#    Verify Login Screen
#    Enter Mobile Number   ${data.mobile_number}
#    Click On Request Otp Button
#    Enter Otp    ${data.otp}
#    Click On Skip Button If Visible
    Click On Fixtures Button
    Click On Add To Calender On Fixtures Screen
    Verify Add To Calender Functionality    ${data.email}    ${data.password}

