*** Settings ***
Library  SeleniumLibrary
Library   DataDriver        ../../TestData/NewUserMultiple_membership_testdata.xlsx
Resource  ../../Resources/Membership/membership_keywords.robot
Resource  ../../Resources/Profile/profile_keywords.robot
Resource  ../../Resources/Login/login_keywords.robot
Resource   ../../../../CommonBase/Cms/Resources/otp_keywords.robot

Test Setup      Launch Application
Test Teardown   Close Browser
Test Template   Verify if the user selectes multiple membership for registered user

*** Variables ***
${testdata_filepath}    ${CURDIR}${/}..${/}..${/}TestData${/}NewUserMultiple_membership_testdata.xlsx

*** Test Cases ***
Verify if the user selectes multiple membership for registered user      ${id}

*** Keywords ***
Verify if the user selectes multiple membership for registered user
    [Arguments]    ${id}
    ${data}    fetch user data by id  ${testdata_filepath}  ${id}
    ${user_data}    create dictionary    &{data}
    Click On Login Button
    Enter Mobile Number     ${user_data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${user_data.mobile_number}
    Enter OTP  ${otp}
    Fill all the manadatory Fields for creating the Profile Page  ${user_data}
    Click And Verify Submit Button
    Select Membership Plan  ${user_data.membership1}
    Verify If User Selectes Pro Plan And Fill The Required Detail
    Verify User Should Redirect To Payment Gateway Screen
    Select Second Membership Plan
    Select Membership Plan  ${user_data.membership2}
    Verify If User Selectes Pro Plan And Fill The Required Detail
    Verify User Should Redirect To Payment Gateway Screen
    Login To CMS And Delete User From CMS   ${user_data.mobile_number}