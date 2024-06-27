*** Settings ***
Library   AppiumLibrary
Library    OperatingSystem
Resource    ../../Resources/Login/login_keywords.robot
Resource    ../../Resources/FLRP/flrp_keywords.robot
Resource    ../../Resources/Fixtures/fixtures_keywords.robot

Test Setup    Open KC application
Test Teardown    Close Application

*** Variables ***
${testdata_new_user}    ${CURDIR}${/}..${/}..${/}TestData${/}flrp_new_user_testdata.xlsx
${testdata_already_registered}    ${CURDIR}${/}..${/}..${/}TestData${/}flrp_new_user_testdata.xlsx

*** Test Cases ***
#Verify user do registration/signup receives 150 tokens (1 time)
#    set library search order    AppiumLibrary    SeleniumLibrary
#    &{data}    fetch data by id    ${testdata_new_user}    1
#    Verify Login Screen
#    Enter Mobile Number    ${data.mobile_number}
#    Click On Request Otp Button
#    Enter Otp From Suggestions
#    Create New Profile    ${data}
#    Click Next And Finish Registration
#    Click On Skip Button If Visible
#    Verify Tokens Are Created    0    150
#    Click On Back Button
#    logout from app
#
#Verify user do refer a friend receives 150 tokens (upto 5 times)
#    set library search order    AppiumLibrary    SeleniumLibrary
#    &{data}    fetch data by id    ${testdata_new_user}    2
#    Verify Login Screen
#    Enter Mobile Number    ${data.mobile_number}
#    Click On Request Otp Button
#    Enter Otp From Suggestions
#    Create New Profile    ${data}
#    Redeem Referral code    ${data.referral_code}
#    Click Next And Finish Registration
#    Click On Skip Button If Visible
#    ${tokens_before}    Get Tokens Earned
#    logout from app
#    Verify Login Screen
#    Enter Mobile Number    ${data.referrel_mobile}
#    Click On Request Otp Button
#    Enter Otp    ${data.otp}
#    Click On Skip Button If Visible
#    Verify Tokens Are Created    1090    ${data.otp}

Verify user do view content receives 10 tokens | upto 2 times
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata_already_registered}    1
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_number}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Click On Skip Button If Visible
    ${tokens_before}    Get Tokens Earned
    Click On Back Button
    Go To News Article Page
    click on first news article
    Click On Back Button
    sleep    1
    Click On Back Button
    Click On Home Button
    wait for 5 seconds
    verify tokens are created    ${tokens_before}    10

Verify user do react/share receives 10 tokens (upto 2 times)
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata_already_registered}    2
#    Verify Login Screen
#    Enter Mobile Number    ${data.mobile_number}
#    Click On Request Otp Button
#    Enter Otp    ${data.otp}
#    Click On Skip Button If Visible
    ${tokens}    Get Tokens Earned
    Click On Back Button
    Open Any Podcast of Knight TV
    Click On Like Icon
    Click On Back Button
    Wait for 5 seconds
    Verify Tokens Are Created    ${tokens}    10

Verify user do interaction with matchcenter receives 10 tokens (upto 2 times)
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata_already_registered}    3
#    Verify Login Screen
#    Enter Mobile Number    ${data.mobile_number}
#    Click On Request Otp Button
#    Enter Otp    ${data.otp}
#    Click On Skip Button If Visible
    ${tokens_before}    Get Tokens Earned
    Click On Back Button
    Click On Fixtures Button
    Click On Matchcenter Button On And Verify Details
    Click On Back Button
    Click On Home Button
    wait for 5 seconds
    verify tokens are created    ${tokens_before}    10

Verify that when a user exchanges tokens for a coupon, the system deducts the appropriate number of tokens from their account in accordance with the specific amount of that coupon.
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata_already_registered}    4
#    Verify Login Screen
#    Enter Mobile Number    ${data.mobile_number}
#    Click On Request Otp Button
#    Enter Otp    ${data.otp}
#    Click On Skip Button If Visible
    ${tokens_before_redeem}    Get Tokens Left
    redeem coupen    ${data.coupen_to_redeem}
    Verify Coupen Redeem Alert
    Click On Back Button
    Click On Back Button
    Verify Tokens Are Deducted From Account    ${tokens_before_redeem}    ${data.coupen_to_redeem}


Confirm that users cannot redeem coupons with a value exceeding their available budget and also verify the alert message of "Insufficient Balance"
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata_already_registered}    5
#    Verify Login Screen
#    Enter Mobile Number    ${data.mobile_number}
#    Click On Request Otp Button
#    Enter Otp    ${data.otp}
#    Click On Skip Button If Visible
    ${tokens}    Get Tokens Earned
    Redeem Coupen    ${data.coupen_to_redeem}
    Verify The Alert Message Of Insufficient Balance

Verify the system accurately distributes coupons based on user activity and also distributes the corresponding coupon codes to those specific users.
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata_already_registered}    6
#    Verify Login Screen
#    Enter Mobile Number    ${data.mobile_number}
#    Click On Request Otp Button
#    Enter Otp    ${data.otp}
#    Click On Skip Button If Visible
    ${tokens_before_redeem}    Get Tokens Left
    redeem coupen    ${data.coupen_to_redeem}
    Verify Coupen Redeem Alert
    Verify User Gets Coupen Code After Redeem

Verify that users must check the checkbox indicating acceptance of the terms and conditions before being allowed to redeem coupons.
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata_already_registered}    7
#    Verify Login Screen
#    Enter Mobile Number    ${data.mobile_number}
#    Click On Request Otp Button
#    Enter Otp    ${data.otp}
#    Click On Skip Button If Visible
    ${tokens}    Get Tokens Earned
    Verify Checkbox Must Be checked Before Redeeming Coupen

Verify that users are prohibited from redeeming tokens for coupons when the status is either "Redeemed" or "Coming Soon".
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata_already_registered}    8
#    Verify Login Screen
#    Enter Mobile Number    ${data.mobile_number}
#    Click On Request Otp Button
#    Enter Otp    ${data.otp}
#    Click On Skip Button If Visible
    ${tokens}    Get Tokens Earned
    Verify Redeemed | Coming Soon Coupens Are Prohibited    Coming Soon
#    Verify Redeemed | Coming Soon Coupens Are Prohibited    Redeemed

Verify user do Click on popups receives 50 tokens (upto 2 times)
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata_already_registered}    9
#    Verify Login Screen
#    Enter Mobile Number    ${data.mobile_number}
#    Click On Request Otp Button
#    Enter Otp    ${data.otp}
#    Click On Skip Button If Visible
    ${tokens_before}    Get Tokens Earned
    Click On Back Button
    Click Button On In App Notifications
    Click On Back Button
    Click On Back Button
    Click On Home Button
    wait for 5 seconds
    Verify Tokens Are Created    ${tokens_before}    50