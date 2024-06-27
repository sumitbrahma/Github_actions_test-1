*** Settings ***
Library  SeleniumLibrary
Library   DataDriver        ../../TestData/nonregisterSingleuser_membership.xlsx.xlsx
Resource  ../../Resources/Login/login_keywords.robot
Resource  ../../Resources/Profile/profile_keywords.robot
Resource    ../../../../CommonBase/Cms/Resources/otp_keywords.robot
Resource    ../../Resources/Membership/membership_keywords.robot

Test Setup      Launch Application
Test Teardown   Close Browser
Test Template   Verify purchase membership functionality once all the mandatory fields get filled

*** Variables ***
${testdata_filepath}    ${CURDIR}${/}..${/}..${/}TestData${/}nonregisterSingleuser_membership.xlsx.xlsx

*** Test Cases ***
Verify purchase membership functionality once all the mandatory fields get filled     ${id}


*** Keywords ***
Verify purchase membership functionality once all the mandatory fields get filled
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
    Select Membership Plan  ${user_data.membership}
    Verify If User Selectes Pro Plan And Fill The Required Detail
    Verify User Should Redirect To Payment Gateway Screen
    Login To CMS And Delete User From CMS   ${user_data.mobile_number}

