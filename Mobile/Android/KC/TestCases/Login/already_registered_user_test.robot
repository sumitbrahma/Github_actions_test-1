*** Settings ***
Library      AppiumLibrary
Library      Screenshot
Library      DocTest.VisualTest
Library      OperatingSystem
Resource    ../../Resources/Login/login_keywords.robot
Resource    ../../Resources/Notification/notification_keywords.robot
Library    ../../../../../CommonBase/Utilities/user_keywords.py
Library    ../../PageObjects/Login/login_locators.py
Test Setup  Open KC application
Test Teardown   Close Application

*** Variables ***

${screenshot_actual_dir}    /Users/Priti/Desktop/SI/wm-indexnine-qa-automation/Runners/Reports/Screenshots/actual_screenshots
${already_registered_user_td}       ${CURDIR}${/}..${/}..${/}TestData${/}already_registered_user_data.xlsx


*** Test Cases ***


TC-01 Verify Valid Indian Mobile Number
    &{login_data}   Fetch Data By Id    ${already_registered_user_td}   1
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Check Otp Screen

TC-02 Verify User Can Request An Otp For Login
    &{login_data}   Fetch Data By Id    ${already_registered_user_td}   2
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Check Otp Screen

TC-03 Verify whether the OTP is delivered to the requested user within time
    &{login_data}   Fetch Data By Id    ${already_registered_user_td}   11
    Verify Login Screen
    Enter Mobile Number     ${login_data}
    Click On Request Otp Button
    Check Otp Delivery

TC-04 Verify the app accepts the otp code successfully
    &{login_data}   Fetch Data By Id    ${already_registered_user_td}   3
    Verify Login Screen
    Enter Mobile Number     ${login_data}
    Click On Request Otp Button
    Enter Otp In Otp Fields    ${login_data}



TC-05 Verify Resend Otp Limit
    &{login_data}   Fetch Data By Id    ${already_registered_user_td}   11
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Verify otp fucntionality

TC-06 Verify Invalid Otp Limit
    &{login_data}   Fetch Data By Id    ${already_registered_user_td}   4
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Verify Invalid Otp


TC-07 Verify Submit Button
    &{login_data}   Fetch Data By Id    ${already_registered_user_td}   5
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Click And Verify Submit Button Is Disabled Without Accepting Terms & Conditions    ${login_data}
    Go Back

TC_08 Verify Skip Button
    Click And Verify Skip Button Before And After Otp Is Requested


TC-09 Verify the UI of the layout of OTP screen
    &{login_data}   Fetch Data By Id    ${already_registered_user_td}   6
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Wait Until Page Contains Element    ${otp_screen}    timeout=30
    Sleep    20
    AppiumLibrary.capture page screenshot    otp_page_screenshot.png
    ${image_path}=    Set Variable    ${screenshot_actual_dir}/otp_page_screenshot.png
    Sleep    20s
    ${cropped_image}=    user_keywords.crop image    ${image_path}    ${image_path}    750    1358
    Compare Images     Runners/Reports/Screenshots/reference_screenshots/otp_page_screenshot.png    ${cropped_image}

TC-9 Verify the UI of the layout of OTP screen with Actual SS
    &{login_data}   Fetch Data By Id    ${already_registered_user_td}   7
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Wait Until Page Contains Element    ${otp_screen}    timeout=30
    Sleep    10
    AppiumLibrary.capture page screenshot    otp_page_screenshot_actual.png
    ${image_path}=    Set Variable    ${screenshot_actual_dir}/otp_page_screenshot_actual.png
    Sleep    20s
    ${cropped_image}=    user_keywords.crop_image    ${image_path}    ${image_path}    750    1358
    Compare Images     Runners/Reports/Screenshots/reference_screenshots/otp_page_screenshot_actual.png    ${cropped_image}



Tc-11 Verify Redirection of Terms & Condition & Privacy Policy
    &{login_data}   Fetch Data By Id    ${already_registered_user_td}   8
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Wait Until Page Contains Element    ${otp_screen}   timeout=30
    Verify Redirection of Terms And Conditions Using Co-ordinates




