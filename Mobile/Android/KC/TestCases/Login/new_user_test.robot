*** Settings ***
Library      AppiumLibrary
Library      Screenshot
Library      DocTest.VisualTest
Library      OperatingSystem
Resource    ../../Resources/Login/new_user_keywords.robot
Resource    ../../Resources/Notification/notification_keywords.robot
Library    ../../../../../CommonBase/Utilities/user_keywords.py
Test Setup  Open KC application
Test Teardown   Close Application

*** Variables ***

${screenshot_actual_dir}    /Users/Priti/Desktop/SI/wm-indexnine-qa-automation/Runners/Reports/Screenshots/actual_screenshots
${new_user_td}       ${CURDIR}${/}..${/}..${/}TestData${/}new_user_data.xlsx

*** Test Cases ***

TC-13 Verify Mandatory Field
    &{login_data}   Fetch Data By Id    ${new_user_td}   1
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Verify Mandatory Fields In Profile Page     ${login_data}



TC-14 Verify Upload Of Picture In DP
    &{login_data}   Fetch Data By Id    ${new_user_td}   2
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Verify If User is Able To Upload Profile Picture



TC-15 Verify Email Address Validation
    &{login_data}   Fetch Data By Id    ${new_user_td}   3
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Verify Validation for Email Address  ${login_data}


TC-16 Verify Progress Bar Validation
    &{login_data}   Fetch Data By Id    ${new_user_td}   4
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Verify Progress Bar Validation In Profile Page



TC-17 Verify User Goes to Selected Team
    &{login_data}   Fetch Data By Id    ${new_user_td}   5
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Verify User Goes to Selected Team   ${login_data}

TC-18 Verify User Can Copy and Paste Referral Code
    &{login_data}   Fetch Data By Id    ${new_user_td}   5
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Check Complete Profile PopUP
    Sleep    3
    Copy The friends Refferal Code
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Enter The Refferal Code

TC-20 Verify Token Reward After Registration
    &{login_data}   Fetch Data By Id    ${new_user_td}   6
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Verify Token Reward After Registration  ${login_data}




TC-21 Verify The UI Of The Welcome Screen
    &{login_data}   Fetch Data By Id    ${new_user_td}   7
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Verify UI Of Welcome Screen  ${login_data}
    Sleep    5
    AppiumLibrary.capture page screenshot    welcome_screen.png
    ${image_path}=    Set Variable    ${screenshot_actual_dir}/welcome_screen.png
    ${cropped_image}=    user_keywords.crop_image    ${image_path}    ${image_path}    770    1334
    Compare Images    Runners/Reports/Screenshots/reference_screenshots/welcome_screen_image.png    ${cropped_image}
    Sleep    15

TC-22 Verify UI Of FAQ Page
    &{login_data}   Fetch Data By Id    ${new_user_td}   8
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Verify UI Of FAQ Screen     ${login_data}
    Sleep    5
    AppiumLibrary.capture page screenshot    faq_screen.png
    ${image_path}=    Set Variable    ${screenshot_actual_dir}/faq_screen.png
    ${cropped_image}=    user_keywords.crop_image    ${image_path}    ${image_path}    750    1788
    Compare Images    Runners/Reports/Screenshots/reference_screenshots/FAQ_screen.png    ${cropped_image}
    Sleep    15

TC-23 Verify UI Of Congratulations Page
    &{login_data}   Fetch Data By Id    ${new_user_td}   9
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Verify UI Of Congratulations Screen     ${login_data}
    Sleep    5
    AppiumLibrary.capture page screenshot    congratulations_screen.png
    ${image_path}=    Set Variable    ${screenshot_actual_dir}/congratulations_screen.png
    ${cropped_image}=    user_keywords.crop_image    ${image_path}    ${image_path}    750    1334
    Compare Images    Runners/Reports/Screenshots/reference_screenshots/congratulations_screen.png    ${cropped_image}
    Sleep    15




TC-24 Verify If User Is Able To access bingo knights without Registeration
    Verify If User Can access bingo knights without registeration

TC-25 Verify If User Able To Redirect To Bingo Webview Screen After Login
    Verify If User Able To Redirect To Bingo Webview Screen

TC-26 Verify Videos Are Auto Play
    Verify videos are auto play Or Not

TC-27 Verify Video Playing Functionality
    Verify videos are auto play Or Not

TC-28 Verify Sharing Functionality Of Video
    Verify sharing functionality of video

TC-29 Verify if user is able to filter the fixtures
    &{login_data}   Fetch Data By Id    ${new_user_td}   10
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Check Complete Profile PopUP
    Verify if user is able to filter the fixtures on webview screen

TC-30 Verify User Can Select Status Filter on Webview Screen
    &{login_data}   Fetch Data By Id    ${new_user_td}   10
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Check Complete Profile PopUP
    Verify If User Can Select Status Filter on Webview Screen

