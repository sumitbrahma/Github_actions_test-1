*** Settings ***
Variables  ../../PageObjects/Login/login_locators.py
Variables  ../../PageObjects/HomePage/homepage_locators.py
Library  ../../../../../CommonBase/Utilities/user_keywords.py
Library     AppiumLibrary
Library    XML
Resource    ../Notification/notification_keywords.robot


*** Variables ***
${android_environment}    ${CURDIR}${/}..${/}..${/}..${/}..${/}..${/}Runners${/}Environment${/}android_environment.json
${android_td}       ${CURDIR}${/}..${/}..${/}TestData${/}already_registered_user_data.xlsx

${match_element}    ${matchcentre_btn}
${expected_match_count}  126
${copied_text}      ${None}
${APPIUM SERVER TIMEOUT}    60000
${Expected_resend_otp_limit_count}     4
${actual_resend_otp_limit_count}   0

*** Keywords ***
Open KC application
    ${env_data}  Get Environment Data    ${android_environment}
    ${env_data}  Create Dictionary  &{env_data}
    Open Application    ${env_data.host}    platformName=${env_data.platformName}   deviceName=${env_data.deviceName}   app=${env_data.application_sdk}      autoGrantPermissions=true    automationName=${env_data.automationName}    noReset=false    newCommandTimeout=${APPIUM SERVER TIMEOUT}


Verify Login Screen
    AppiumLibrary.Wait Until Element Is Visible   ${login_view}   timeout=120

Enter Mobile Number
    [Arguments]  ${user_data}
    Log    ${user_data}
    Input Text    ${mobile_field}    ${user_data.mob_number}

Click On Request Otp Button
    Wait Until Element Is Visible    ${request_otp_btn}
    Click Element    ${request_otp_btn}


Check Otp Screen
     Wait Until Element Is Visible    ${otp_screen}  timeout=30
     Element Should Be Visible    ${otp_screen}


Enter Otp In Otp Fields
    [Arguments]  ${otp_data}
    Wait Until Element Is Visible    ${otp_screen}  timeout=30
    ${el1} =    Set Variable     ${otp_fields}
    Input Text    ${el1}    ${otp_data.otp}
    Click Element    ${disclaimer_checkbox}
    Click Element    ${privacy_policy_checkbox}
    Click Element    ${submit_button}

Check Otp Delivery
     Open Notification Panel
     ${status}   run keyword and return status   Wait Until Element Is Visible   ${clear_notification}   timeout=30
     IF  ${status}
        Click Element    ${clear_notification}
     END
     Open Notification Panel
     Wait Until Element Is Visible    //android.widget.TextView[@resource-id="android:id/conversation_text" and @text="CP-AMIKKR"]  timeout=120
     Element Should Be Visible    //android.widget.TextView[@resource-id="android:id/conversation_text" and @text="CP-AMIKKR"]  timeout=120
     Go Back


Verify otp fucntionality
    ${actual_resend_otp_limit_count}=    Set Variable    0
    Wait Until Element Is Visible    ${otp_screen}  timeout=30
    Wait Until Element Is Visible    ${resend_otp_button}       timeout=30
    Sleep    130
    Click Element    ${resend_otp_button}
    Wait Until Page Contains Element    ${success_toast}    timeout=10
    ${actual_resend_otp_limit_count}=    Evaluate    int(${actual_resend_otp_limit_count}) + 1
    Sleep    130
    Click Element    ${resend_otp_button}
    Wait Until Page Contains Element    ${success_toast}    timeout=10
    ${actual_resend_otp_limit_count}=    Evaluate    int(${actual_resend_otp_limit_count}) + 1
    Sleep    130
    Click Element    ${resend_otp_button}
    Wait Until Page Contains Element    ${success_toast}    timeout=10
    ${actual_resend_otp_limit_count}=    Evaluate    int(${actual_resend_otp_limit_count}) + 1
    Sleep    130
    Click Element    ${resend_otp_button}
    Wait Until Page Contains Element    ${success_toast}    timeout=10
    ${actual_resend_otp_limit_count}=    Evaluate    int(${actual_resend_otp_limit_count}) + 1
    Sleep    130
    Click Element    ${resend_otp_button}
    Wait Until Element Is Visible    ${blocked_number_toast}    timeout=30
    Element Should Be Visible    ${blocked_number_toast}
    check otp limit

check otp limit
    Should Be Equal As Integers    ${Expected_resend_otp_limit_count}    ${actual_resend_otp_limit_count}



Verify Country Code And Mobile Number
    ${country_code}  Get Text    ${country_code_field}
    Should Be Equal    ${country_code}    +91
    ${mobile_number}  Get Text    ${mobile_field}
    Length Should Be    ${mobile_number}    10
    Click On Request Otp Button

Verify Incorrect Mobile Number Message
    Wait Until Page Contains Element    ${wrong_number_toast}   timeout=30



Blocked Toast Should Not Be Visible
    [Arguments]    ${element}
    Page Should Not Contain Element   ${element}

Blocked Toast Should Be Visible
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

Verify Invalid Otp
    Wait Until Element Is Visible    ${otp_screen}  timeout=30
    ${el2} =    Set Variable     ${otp_fields}
    Input Text    ${el2}    123451
    Click Element    ${disclaimer_checkbox}
    Click Element    ${privacy_policy_checkbox}
    Click Element    ${submit_button}
    Sleep    5
    Wait Until Element Is Visible   ${otp_fields}   timeout=30
    Clear Text    ${otp_fields}
    ${el2} =    Set Variable     ${otp_fields}
    Input Text    ${el2}    123452
    Click Element    ${submit_button}
    Sleep    5
    Wait Until Element Is Visible   ${otp_fields}   timeout=30
    Clear Text    ${otp_fields}
    ${el2} =    Set Variable     ${otp_fields}
    Input Text    ${el2}    123453
    Click Element    ${submit_button}
    Sleep    5
    Wait Until Element Is Visible   ${otp_fields}   timeout=30
    Clear Text    ${otp_fields}
    ${el2} =    Set Variable     ${otp_fields}
    Input Text    ${el2}    123454
    Click Element    ${submit_button}
    Wait Until Element Is Visible    ${blocked_number_toast}    timeout=30
    Element Should Be Visible    ${blocked_number_toast}
    Go Back


Click And Verify Submit Button Is Disabled Without Accepting Terms & Conditions
    [Arguments]  ${otp_data}
    Wait Until Element Is Visible    ${otp_screen}  timeout=30
    ${el2} =    Set Variable     ${otp_fields}
    Input Text    ${el2}    ${otp_data.otp}
    Click Element   ${submit_button}
    ${status}  Run Keyword And Return Status    Wait Until Element Is Visible    ${home_link}  timeout=15
    Should Be Equal    ${status}    ${False}
    Go Back



Click And Verify Skip Button Before And After Otp Is Requested
    &{login_data}   Fetch Data By Id    ${android_td}   4
    Wait Until Element Is Visible   ${login_skip_button}   timeout=30
    Click Element    ${login_skip_button}
    Wait Until Page Contains Element    ${homepage_title}  timeout=30
    Element Should Be Visible    ${homepage_title}
    Click Element    ${profile_logo_button}
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Wait Until Element Is Visible    ${otp_screen}  timeout=30
    Wait Until Element Is Visible    ${login_skip_button}
    Click Element    ${login_skip_button}
    Wait Until Page Contains Element    ${homepage_title}   timeout=30
    Element Should Be Visible    ${homepage_title}
    Click Element    ${profile_logo_button}


Verify Redirection of Terms And Conditions Using Co-ordinates
    @{finger} =    Create List    ${311}    ${1151}
    Tap With Positions    ${100}    ${finger}
    Wait Until Page Contains Element    ${privacy_policy_page_title}    timeout=30
    Page Should Contain Element    ${privacy_policy_page_title}
    Click Element    ${back_button}
    Wait Until Page Contains Element    ${otp_screen}    timeout=30
    @{finger1} =    Create List    ${560}    ${1218}
    Tap With Positions    ${100}    ${finger1}
    Wait Until Page Contains Element    ${terms_and_conditions_page_title}  timeout=30
    Page Should Contain Element    ${terms_and_conditions_page_title}
    Click Element    ${back_button}
    Wait Until Page Contains Element    ${otp_screen}    timeout=30
    Go Back




