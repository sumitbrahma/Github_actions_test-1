*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Membership/membership_keywords.robot
Resource  ../../Resources/Profile/profile_keywords.robot
Resource  ../../Resources/Login/login_keywords.robot
Resource    ../../../../CommonBase/Cms/Resources/otp_keywords.robot
Resource    ../../Resources/Gaming/gaming_keywords.robot

Test Setup      Launch Application
Test Teardown   Close Browser

*** Variables ***
${testdata}    ${CURDIR}${/}..${/}..${/}TestData${/}Gaming_testdata.xlsx

*** Test Cases ***
Tc10 Verify if user is logged and redirecting quizer page
    &{data}    fetch data by id    ${testdata}    1
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Click On Quizzer From Menu
    User Shouldn't Ask For Login Again Will Able To View Play Now Button

Tc11 Verify If User Is Not Logged In And Try To Access Quizer
    &{data}    fetch data by id    ${testdata}    2
    Click On Login Button
    Click On Quizzer From Menu
    CLick On Quizzer Menu Without Login
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Getting Login Screen And Play Now Button