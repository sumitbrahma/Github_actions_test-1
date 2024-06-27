*** Settings ***
Library   AppiumLibrary
Variables  ../../PageObjects/Login/login_locators.py
Variables  ../../PageObjects/HomePage/homepage_locators.py
Variables  ../../PageObjects/Notification/notification_locators.py

Library    String
Library    Collections
Library    RequestsLibrary


*** Keywords ***
Open Notification Panel
    Open Notifications

Get Notification Details
    Wait Until Page Contains Element    ${notification_big_image}   timeout=600
    ${title}  Get Text    ${notification_title}
    ${text}  Get Text    ${notification_text}
    ${notification_data}  Create Dictionary  NotifiactionTitle=${notification_title}  NotificationText=${text}
    RETURN    ${notification_data}

Get Otp Details
    Wait Until Element Is Visible    //android.widget.TextView[@resource-id="android:id/conversation_text" and @text="CP-AMIKKR"]  timeout=120
    ${message}  Get Text    //android.widget.TextView[@resource-id="android:id/message_text"]
    ${otp_pattern}    Set Variable    \\d{6}  # Regex pattern for a 6-digit OTP
    ${otp}    Get Regexp Matches    ${message}    ${otp_pattern}
    Should Be Equal As Numbers    ${otp.__len__()}    1    # Ensure only one match
    ${otp_value}    Get From List    ${otp}    0    # Extract the OTP from the match list
    RETURN  ${otp_value}

Collapse Notification
    ${status}  Run Keyword And Return Status    Wait Until Page Contains Element    ${collaps_arrow}  timeout=10
    IF    ${status}
        Click Element    ${collaps_arrow}
    END


Click On Push Notification
    [Arguments]  ${notification_title}
    Wait Until Page Contains Element  ${notification_title}    timeout=30
    Click Element    ${notification_title}

Verify Push Notification Redirects To Required Page
    [Arguments]  ${title}
    Wait Until Page Contains Element    ${title}   timeout=120


#in app notification
Click On In App Notification
    [Arguments]  ${button}
    Wait Until Element Is Visible    ${button}  timeout=60
    Click Element    ${button}

Verify In App Notification Redirects To Required Page
    [Arguments]  ${title}
    Wait Until Page Contains Element    ${title}   timeout=120



