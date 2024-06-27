*** Settings ***
Library  SeleniumLibrary
Resource    ../../Resources/Membership/membership_keywords.robot
Resource  ../../Resources/Profile/profile_keywords.robot
Resource  ../../Resources/Login/login_keywords.robot
Resource    ../../../../CommonBase/Cms/Resources/otp_keywords.robot
Resource  ../../Resources/Gaming/gaming_keywords.robot
Resource    ../../Resources/Membership/membership_page_navigation.robot

Test Setup      Launch Application
Test Teardown   Close Browser

*** Variables ***
${testdata}    ${CURDIR}${/}..${/}..${/}TestData${/}purchase_membershipscreen_data.xlsx

*** Test Cases ***
TC_018 Verify user contain 3 membership plan on page
    &{data}    fetch data by id    ${testdata}      1
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration  ${data.email}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Sleep    10s
    Login To CMS And Delete User From CMS  ${data.mobile_number}

TC_019 Verify that user can purchase junior membership plan
    &{data}    fetch data by id    ${testdata}      2
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration   ${data.email}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Sleep    20s
    Verify navigation to junior membership form
    Enter Required Details For Junior Membership
    Sleep    20s
    Submit the data and proceed to payment option
    verify payment process for membership plan
    Verify invoice creation of payment
    Login To CMS And Delete User From CMS   ${data.mobile_number}

TC_020 Verify coupon code section on required feilds screen for junior membership plan
    &{data}    fetch data by id    ${testdata}      3
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration     ${data.email}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Sleep    20s
    Verify navigation to junior membership form
    Enter Required Details For Junior Membership
    Verify coupon code section on required feilds screen for membership plan
    Login To CMS And Delete User From CMS   ${data.mobile_number}

TC_021 Verify that post completon of payment gateway
    &{data}    fetch data by id    ${testdata}      9
    verify delete all emails
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration  ${data.email}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Sleep    20s
    Verify navigation to junior membership form
    Enter Required Details For Junior Membership
    Sleep    20s
    Submit the data and proceed to payment option
    verify payment process for membership plan
    Verify invoice creation of payment
    Sleep    10s
    Verify Email
    Login To CMS And Delete User From CMS   ${data.mobile_number}

TC_022 Verify that user already purchased this plan then that membership plan button will disable
    &{data}    fetch data by id    ${testdata}      4
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration   ${data.email}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Sleep    20s
    Verify navigation to junior membership form
    Enter Required Details For Junior Membership
    Sleep    20s
    Submit the data and proceed to payment option
    verify payment process for membership plan
    Verify invoice creation of payment
    Verify membership plan purchase button is disable
    Login To CMS And Delete User From CMS   ${data.mobile_number}

TC_023 verify that when user use 100% off coupon then user will not get invoice
    &{data}    fetch data by id    ${testdata}      5
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration   ${data.email}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Verify navigation to junior membership form
    Enter Required Details For Junior Membership
    Enter data in coupon feild for 100% off on membership plan
    Sleep    20s
    Submit the data and proceed to payment option
    Sleep    60s
    Verify 10% discount for coupon code
    verify payment process for membership plan
    Verify invoice creation of payment
    Login To CMS And Delete User From CMS   ${data.mobile_number}

TC_024 verify that multiple users can use 10% off coupon for Junior membership plan
    &{data}    fetch data by id    ${testdata}      6
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration   ${data.email}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Verify navigation to junior membership form
    Enter Required Details For Junior Membership
    Enter data in coupon feild for junior membership plan
    Submit the data and proceed to payment option
    Verify 10% discount for coupon code
    verify payment process for membership plan
    Verify invoice creation of payment
    Verify logout button of website
    &{data}    fetch data by id    ${testdata}      7
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration   ${data.email}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Verify navigation to junior membership form
    Enter Required Details For Junior Membership
    Enter data in coupon feild for junior membership plan
    Submit the data and proceed to payment option
    Verify 10% discount for coupon code
    verify payment process for membership plan
    Verify invoice creation of payment
    Login To CMS And Delete User From CMS   ${data.mobile_number}

TC_025 verify that multiple users can use 10% off coupon for Pro membership plan
    &{data}    fetch data by id    ${testdata}      8
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration   ${data.email}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Verify navigation to pro membership form page
    Enter Required Details For pro Membership
    Verify coupon code section on required feilds screen for membership plan
    Enter data in coupon feild for pro membership plan
    Submit the data and proceed to payment option
    Verify 10% discount for coupon code
    verify payment process for membership plan
    Verify invoice creation of payment
    Verify logout button of website
    &{data}    fetch data by id    ${testdata}      10
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration   ${data.email}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Verify navigation to pro membership form page
    Enter Required Details For pro Membership
    Verify coupon code section on required feilds screen for membership plan
    Enter data in coupon feild for pro membership plan
    Submit the data and proceed to payment option
    Verify 10% discount for coupon code
    verify payment process for membership plan
    Verify invoice creation of payment
    Login To CMS And Delete User From CMS   ${data.mobile_number}

TC_026 Verify that UNIJUN coupon code can be used only once
    &{data}    fetch data by id    ${testdata}      11
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration   ${data.email}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Verify navigation to junior membership form
    Enter Required Details For Junior Membership
    Enter Unique coupon code in coupon code feild for junior membership plan
    Login To CMS And Delete User From CMS   ${data.mobile_number}