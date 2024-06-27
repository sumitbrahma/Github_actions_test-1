*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    ../../../../../CommonBase/Utilities/user_keywords.py
Variables   ../../PageObjects/AccessibilityID/accessibility_id.py
Variables   ../../PageObjects/Login/login_locators.py

*** Variables ***
${iOS_environment}   ${CURDIR}${/}..${/}..${/}..${/}..${/}..${/}Runners${/}Environment${/}ios_environment.json

*** Keywords ***
Open KC application
    ${env_data}  Get Environment Data    ${iOS_environment}
    Log To Console    ${env_data}
    ${env_data}  Create Dictionary  &{env_data}
    Open Application    ${env_data.host}    platformName=${env_data.platformName}   deviceName=${env_data.deviceName}   bundleId=${env_data.bundleId}    autoGrantPermissions=true    automationName=${env_data.automationName}    noReset=false     udid=${env_data.udid}
#    Open Application    ${env_data.host}    platformName=${env_data.platformName}   deviceName=${env_data.deviceName}   app=${env_data.ipa_file}    autoGrantPermissions=true    automationName=${env_data.automationName}    noReset=false     udid=${env_data.udid}    autoAcceptAlerts=true
#    Accept All App Permissions

Accept All App Permissions
    FOR    ${i}    IN RANGE    1    5
        ${status}  Run Keyword And Return Status  Wait Until Page Contains Element    accessibility_id=Allow    timeout=10
        IF    ${status}
             Click Element    accessibility_id=Allow
        ELSE
            exit for loop
        END
    END

Verify Login Screen
    wait Until Element Is Visible   ${login_label}   timeout=30
    wait Until Element is Visible   ${welcome_text}  timeout=20

Enter Mobile Number
    [Arguments]  ${mobile_number}
    Click Element   ${enter_mobile_number_text}
    Input Text    ${mobile_field}    ${mobile_number}
    sleep    8s
    AppiumLibrary.wait Until Element is Visible    ${done_button_keypad}    timeout=10
    Click Element   ${done_button_keypad}

Click On Skip Button If Visible
    ${status}    run keyword and return status    wait until element is visible     accessibility_id=${skip_id}
    IF    ${status}
        click element     accessibility_id=${skip_id}
    END

Wait for 5 seconds
    sleep    5s

Click On Request Otp Button
    Wait Until Element is Visible   ${request_otp_button}  timeout=5
    Click Element    ${request_otp_button}

Verify Country Code And Mobile Number
    ${country_code}  Get Text    ${country_code_field}
    Should Be Equal    ${country_code}    +91
    ${mobile_number}  Get Text    ${mobile_field}
    Length Should Be    ${mobile_number}    10
    Click On Request Otp Button

Verify Incorrect Mobile Number Message
    Wait Until Page Contains Element    ${wrong_number_text}   timeout=30

Click And Verify Skip Button
    Wait Until Element Is Visible   ${skip_button}   timeout=30
    Click Element    ${skip_button}
    ${status}  Run Keyword And Return Status  Wait Until Page Contains Element    ${cross_button}  timeout=10
    IF    ${status}
         Click Element  ${cross_button}
    END
    Wait Until Page Contains Element    ${homepage_title}  timeout=30

Enter Otp
    [Arguments]    ${otp}
    ${otp}     convert to string    ${otp}
    wait until page contains element    ${otp_field}  timeout=30
    Input Text    ${otp_field}    ${otp}[0]
    Input Text    ${otp_field}    ${otp}[1]
    Input Text    ${otp_field}    ${otp}[2]
    Input Text    ${otp_field}    ${otp}[3]
    Input Text    ${otp_field}    ${otp}[4]
    Input Text    ${otp_field}    ${otp}[5]
    ${el8} =    Set Variable     ${terms_checkbox_1}
    Click Element    ${el8}
    ${el9} =    Set Variable     ${terms_checkbox_2}
    Click Element    ${el9}
    ${el10} =    Set Variable     xpath=//XCUIElementTypeButton[@name="SUBMIT${SPACE}${SPACE}"]
    Click Element    ${el10}

Enter Otp From Suggestions
    wait until page contains element    ${otp_field}  timeout=30
    Click Element    ${otp_field}
    wait until page contains element     accessibility_id=${suggestion_id}    timeout=30
    Click Element    accessibility_id=${suggestion_id}
    ${el8} =    Set Variable     ${terms_checkbox_1}
    Click Element    ${el8}
    ${el9} =    Set Variable     ${terms_checkbox_2}
    Click Element    ${el9}
    ${el10} =    Set Variable     xpath=//XCUIElementTypeButton[@name="SUBMIT${SPACE}${SPACE}"]
    Click Element    ${el10}

Create New Profile
    [Arguments]    ${data}
    wait until page contains element    ${first_name_field}    timeout=30
    Input Text    ${first_name_field}    ${data.first_name}
    Input Text    ${last_name_field}    ${data.last_name}
    Input Text    ${email_field}   ${data.email}
    Click Element    accessibility_id=${done_id}

Click Next And Finish Registration
    wait until page contains element  ${registration_next_button}
    Click Element    ${registration_next_button}
    sleep    2
    wait until page contains element    ${registration_ok_button}
    Click Element    ${registration_ok_button}
    wait until page contains element     ${lets_get_started_button}
    Click Element    ${lets_get_started_button}
    wait until page contains element    ${wohoo_thankyou_button}
    Click Element    ${wohoo_thankyou_button}

Redeem Referral code
    [Arguments]    ${referral_code}
    wait until page contains element     ${referral_field}
    Input Text    ${referral_field}    ${referral_code}
    wait until page contains element     ${redeem_button}
    Click Element    ${redeem_button}
    wait until page contains    Referral Code Validation Success

Open IOS Notifications
    sleep    1
    Swipe    ${35}    ${0}    ${28}    ${650}
    sleep    1

Logout From App
    wait until page contains element     accessibility_id=${edit_profile_id}
    Click Element    accessibility_id=${edit_profile_id}
    wait until page contains element     accessibility_id=${logout_button_id}
    Click Element    accessibility_id=${logout_button_id}
    wait until page contains element     accessibility_id=${ok_id}
    Click Element    accessibility_id=${ok_id}
    wait until page contains element    ${login_view}

# code is in progress -
#Close the application
#    ${env_data}  Get Environment Data    ${iOS_environment}
#    Log To Console    ${env_data}
#    ${env_data}  Create Dictionary  &{env_data}
#    execute adb shell    pm uninstall   ${env_data.bundleId}
