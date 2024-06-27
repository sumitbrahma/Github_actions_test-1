*** Settings ***
Variables  ../../PageObjects/Login/login_locators.py
Variables  ../../PageObjects/HomePage/homepage_locators.py
Library  ../../../../../CommonBase/Utilities/user_keywords.py
Library     AppiumLibrary
Library    XML
Resource    ../Notification/notification_keywords.robot


*** Variables ***
${android_environment}    ${CURDIR}${/}..${/}..${/}..${/}..${/}..${/}Runners${/}Environment${/}android_environment.json
${new_user_td}       ${CURDIR}${/}..${/}..${/}TestData${/}new_user_data.xlsx

${expected_match_count}  126
${copied_text}      ${None}
${APPIUM SERVER TIMEOUT}    60000


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


Enter Otp In Otp Fields For New User
    [Arguments]  ${otp_data}
    Wait Until Element Is Visible    ${otp_screen}  timeout=30
    ${el1} =    Set Variable     ${otp_fields}
    Input Text    ${el1}    ${otp_data}
    Click Element    ${disclaimer_checkbox}
    Click Element    ${privacy_policy_checkbox}
    Click Element    ${submit_button}


Blocked Toast Should Not Be Visible
    [Arguments]    ${element}
    Page Should Not Contain Element   ${element}

Blocked Toast Should Be Visible
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}


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


Get Otp From Notification Panel
    &{login_data}   Fetch Data By Id    ${new_user_td}   11
    Open Notification Panel
    ${status}   run keyword and return status   Wait Until Element Is Visible   ${clear_notification}   timeout=30
    IF  ${status}
        Click Element    ${clear_notification}
    END
    Open Notification Panel
    ${otp}  Get Otp Details
    Go Back
    Enter Otp In Otp Fields For New User   ${otp}

Verify Mandatory Fields In Profile Page
    [Arguments]  ${user_data}
    Wait Until Page Contains Element    ${create_account_heading}   timeout=30
    Click Element    ${lastname}
    Input Text    ${lastname}   ${user_data.lastname}
    Click Element    ${email}
    Input Text    ${email}    ${user_data.email}
    Hide Keyboard
    Swipe    ${630}    ${974}    ${636}    ${365}
    Wait Until Element Is Visible    ${Next_button}
    Click Element    ${Next_button}
    Wait Until Page Contains Element    ${firstname_toast}  timeout=30
    Page Should Contain Element    ${firstname_toast}
    Sleep    5
    Clear Text    ${Lastname}
    Click Element    ${firstname}
    Input Text    ${firstname}    ${user_data.firstname}
    Hide Keyboard
    Wait Until Element Is Visible    ${Next_button}
    Click Element    ${Next_button}
    Wait Until Page Contains Element    ${lastname_toast}  timeout=30
    Sleep    3
    Click Element    ${Lastname}
    Input Text    ${Lastname}   ${user_data.lastname}
    Clear Text    ${email}
    Hide Keyboard
    Wait Until Element Is Visible    ${Next_button}
    Click Element    ${Next_button}
    Wait Until Page Contains Element    ${Email_toast}  timeout=30
    Sleep   5




Verify If User is Able To Upload Profile Picture
    Wait Until Page Contains Element    ${create_account_heading}   timeout=30
    Click Element    ${edit_profile_logo}
    Wait Until Element Is Visible    ${camera_option}
    Click Element    ${camera_option}
    Wait Until Element Is Visible    ${take_picture_button}
    Click Element    ${take_picture_button}
    Wait Until Element Is Visible    ${camera_ok_button}
    Click Element    ${camera_ok_button}
    Sleep    5





Verify Validation for Email Address
    [Arguments]  ${user_td}
    Wait Until Page Contains Element    ${create_account_heading}   timeout=30
    Click Element    ${firstname}
    Input Text    ${firstname}    ${user_td.firstname}
    Click Element    ${lastname}
    Input Text    ${lastname}    ${user_td.lastname}
    Click Element    ${email}
    Enter Invalid Email Address    user!#@gmail.com
    Swipe    ${630}    ${974}    ${636}    ${365}
    Wait Until Element Is Visible    ${Next_button}
    Click Element    ${Next_button}
    Wait Until Page Contains Element    ${Email_toast}  timeout=30
    Sleep    3
    Clear Text    ${email}
    Enter Invalid Email Address    user&@example.c
    Wait Until Element Is Visible    ${Next_button}
    Click Element    ${Next_button}
    Wait Until Page Contains Element    ${Email_toast}  timeout=30
    Sleep    3
    Clear Text    ${email}
    Enter Valid Email Address    ${user_td.email}
    Wait Until Element Is Visible    ${Next_button}     timeout=30
    Click Element    ${Next_button}
    Wait Until Element Is Visible    ${welcome_screen}      timeout=30
    Click Element    ${welcome_screen_ok_button}
    Wait Until Element Is Visible    ${faq_Page}    timeout=30
    Click Element    ${faq_Page_next_button}
    Wait Until Element Is Visible    ${congratulations_screen}  timeout=30
    Click Element    ${congratulations_screen_thnks_btn}
    Wait Until Element Is Visible    ${complete_profile_popup}  timeout=30
    Click Element    ${complete_profile_popup_okbtn}
    Sleep    10

Enter Invalid Email Address
    [Arguments]    ${emailadd}
    Input Text    ${email}    ${emailadd}
    Hide Keyboard

Enter Valid Email Address
    [Arguments]    ${emailaddd}
    Input Text    ${email}    ${emailaddd}
    Hide Keyboard



Verify Progress Bar Validation In Profile Page
    Wait Until Element Is Visible    ${create_account_heading}   timeout=30
    Element Should Be Visible    ${progress_bar_before_team_selection}
    Click Element    ${primary_team_2}
    Wait Until Page Contains Element   ${progress_bar_after_team_selection}
    Element Should Be Visible    ${progress_bar_after_team_selection}
    Click Element    ${primary_team_1}
    Element Should Be Visible    ${progress_bar_before_team_selection}
    Sleep    5



Verify User Goes to Selected Team
    [Arguments]  ${user_data}
    ${user_td}   Create Dictionary   ${user_data}
    Enter Profile Details   ${user_td}
    Select Primary Team
    Swipe    ${630}    ${974}    ${636}    ${365}
    Wait Until Element Is Visible    ${Next_button}
    Click Element    ${Next_button}
    Wait Until Element Is Visible    ${welcome_screen}  timeout=30
    Click Element    ${welcome_screen_ok_button}
    Wait Until Element Is Visible    ${faq_Page}    timeout=30
    Click Element    ${faq_Page_next_button}
    Wait Until Element Is Visible    ${congratulations_screen}  timeout=30
    Click Element    ${congratulations_screen_thnks_btn}
    Wait Until Element Is Visible    ${complete_profile_popup}  timeout=30
    Click Element    ${complete_profile_popup_okbtn}
    Wait Until Element Is Visible    ${tkr_team_logo}   timeout=30
    Element Should Be Visible    ${tkr_team_logo}
    Sleep    5


Verify UI Of Welcome Screen
    [Arguments]  ${user_data}
    ${user_td}   Create Dictionary   ${user_data}
    Enter Profile Details   ${user_td}
    Swipe    ${630}    ${974}    ${636}    ${365}
    Wait Until Element Is Visible    ${Next_button}
    Click Element    ${Next_button}
    Wait Until Element Is Visible    ${welcome_screen}  timeout=30

Verify UI Of FAQ Screen
    [Arguments]  ${user_data}
    ${user_td}   Create Dictionary   ${user_data}
    Enter Profile Details   ${user_td}
    Click Element    ${welcome_screen_ok_button}
    Wait Until Element Is Visible    ${faq_Page}    timeout=30

Verify UI Of Congratulations Screen
    [Arguments]  ${user_data}
    ${user_td}   Create Dictionary   ${user_data}
    Enter Profile Details   ${user_td}
    Click Element    ${faq_Page_next_button}
    Wait Until Element Is Visible    ${congratulations_screen}  timeout=30






Verify Token Reward After Registration
    [Arguments]  ${user_data}
    ${user_td}   Create Dictionary   ${user_data}
    Enter Profile Details   ${user_td}
    Swipe    ${630}    ${974}    ${636}    ${365}
    Wait Until Element Is Visible    ${Next_button}
    Click Element    ${Next_button}
    Wait Until Element Is Visible    ${welcome_screen}  timeout=30
    Click Element    ${welcome_screen_ok_button}
    Wait Until Element Is Visible    ${faq_Page}    timeout=30
    Click Element    ${faq_Page_next_button}
    Wait Until Element Is Visible    ${congratulations_screen}  timeout=30
    Element Should Be Visible    ${congratulations_screen}
    Wait Until Element Is Visible    ${reward_text}      timeout=30
    Element Should Be Visible    ${reward_text}
    Sleep    5


Enter Profile Details
    [Arguments]  ${user_data}
    Wait Until Page Contains Element    ${create_account_heading}   timeout=30
    Click Element    ${firstname}
    Input Text    ${firstname}    ${user_data.firstname}
    Click Element    ${lastname}
    Input Text    ${lastname}   ${user_data.lastname}
    Click Element    ${email}
    Enter Valid Email Address    ${user_data.email}
    Hide Keyboard



Select Primary Team
    Click Element    ${primary_team_3}


Verify If User Can access bingo knights without registeration
    Wait Until Element Is Visible   ${login_skip_button}   timeout=30
    Click Element    ${login_skip_button}
    Wait Until Page Contains Element    ${homepage_title}  timeout=30
    Page Should Contain Element    ${homepage_title}
    Sleep    5
    Swipe    ${502}    ${779}    ${527}    ${298}
    Swipe    ${329}    ${865}    ${356}    ${353}
    Sleep    5
    Wait Until Element Is Visible    ${play_now_button}     timeout=30
    Element Should Be Visible    ${play_now_button}
    Click Element    ${play_now_button}
    Wait Until Page Contains Element    ${registeration_popup}  timeout=30
    Element Should Be Visible    ${registeration_popup}
    Click Element    ${registeration_popup_ok_button}



Verify If User Able To Redirect To Bingo Webview Screen
    &{login_data}   Fetch Data By Id    ${new_user_td}   11
    ${user_td}   Create Dictionary   ${login_data}
    Wait Until Element Is Visible   ${login_skip_button}   timeout=30
    Click Element    ${login_skip_button}
    Wait Until Page Contains Element    ${homepage_title}  timeout=30
    Page Should Contain Element    ${homepage_title}
    Sleep    5
    Swipe    ${502}    ${779}    ${527}    ${298}
    Swipe    ${329}    ${865}    ${356}    ${353}
    Wait Until Page Contains Element    ${play_now_button}
    Element Should Be Visible    ${play_now_button}
    Click Element    ${play_now_button}
    Wait Until Page Contains Element    ${registeration_popup}  timeout=30
    Element Should Be Visible    ${registeration_popup}
    Click Element    ${registeration_popup_ok_button}
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Enter Profile Details   ${user_td}
    Swipe    ${630}    ${974}    ${636}    ${365}
    Wait Until Element Is Visible    ${Next_button}
    Click Element    ${Next_button}
    Wait Until Element Is Visible    ${welcome_screen}  timeout=30
    Click Element    ${welcome_screen_ok_button}
    Wait Until Element Is Visible    ${faq_Page}    timeout=30
    Click Element    ${faq_Page_next_button}
    Wait Until Page Contains Element    ${play_now_button}  timeout=30
    Click Element    ${play_now_button}
    Wait Until Page Contains Element    ${bingo_webview_screen}
    Element Should Be Visible    ${bingo_webview_screen}




Logout From App
    Wait Until Element Is Visible    ${user_name}   timeout=30
    Click Element    ${user_name}
    Wait Until Element Is Visible    ${profile_logo}    timeout=30
    Click Element    ${profile_logo}
    Wait Until Element Is Visible    ${logout_btn}  timeout=30
    Click Element    ${logout_btn}





Copy The friends Refferal Code
    Wait Until Element Is Visible    ${user_name}   timeout=30
    Click Element    ${user_name}
    Wait Until Element Is Visible    ${invite_frd}  timeout=30
    Click Element    ${invite_frd}
    Wait Until Element Is Visible    ${refferal_code_field}     timeout=30
    ${copied_text}=     Get Text    ${refferal_code_field}
    Set Suite Variable    ${copied_text}    ${copied_text}
    Wait Until Element Is Visible    ${copy_referral_code}  timeout=30
    Click Element    ${copy_referral_code}

    Sleep    5
    Wait Until Element Is Visible    ${cross_referral_code}  timeout=30
    Click Element    ${cross_referral_code}
    Wait Until Element Is Visible    ${profile_logo}    timeout=30
    Click Element    ${profile_logo}
    Wait Until Element Is Visible    ${logout_btn}  timeout=30
    Click Element    ${logout_btn}
    Sleep    10

Paste Text Into Field
    Press Keycode    279    # KeyCode for LONG PRESS
    Press Keycode    50



Enter The Refferal Code
    Wait Until Page Contains Element    ${create_account_heading}   timeout=30
    Wait Until Element Is Visible    ${refferal_code}   timeout=30
    Click Element    ${refferal_code}
    Paste Text Into Field
    Verify Text Has Been Pasted Correctly
    Sleep    10



Verify Text Has Been Pasted Correctly
    ${pasted_text}=    Get Text    ${refferal_code}
    Should Be Equal As Strings    ${pasted_text}    ${copied_text}



Check Complete Profile PopUP
    ${status}   run keyword and return status   Wait Until Element Is Visible   ${complete_profile_popup}   timeout=30
    IF  ${status}
        Click Element    ${complete_profile_popup_okbtn}
    END

Check Complete Profile message
    Wait Until Element Is Visible   ${complete_profile_popup}   timeout=30
    Element Should Be Visible    ${complete_profile_popup}
    Click Element    ${complete_profile_popup_okbtn}


Swipe Down Until Element Is Visible
    [Arguments]    ${element}
    FOR  ${count}  IN RANGE    0    10
        Swipe    ${329}    ${865}    ${356}    ${353}
        ${status}    run keyword and return status    element should be visible   ${element}
        IF    ${status}
            exit for loop
        END
    END


Swipe Down Until Element Is Visible New
    [Arguments]    ${element}
    FOR  ${count}  IN RANGE    0    10
        Swipe    ${438}    ${999}    ${438}    ${444}
        ${status}    run keyword and return status    element should be visible   ${element}
        IF    ${status}
            exit for loop
        END
    END


Swipe Up Until Element Is Visible
    [Arguments]    ${element}
    FOR  ${count}  IN RANGE    0    10
       Swipe    ${718}    ${207}    ${658}    ${1507}
        ${status}    run keyword and return status    element should be visible   ${element}
        IF    ${status}
            exit for loop
        END
    END

Verify videos are auto play Or Not
    Wait Until Element Is Visible   ${login_skip_button}   timeout=30
    Click Element    ${login_skip_button}
    Wait Until Page Contains Element    ${clips_link}  timeout=30
    Click Element    ${clips_link}
    Wait Until Page Contains Element    ${home_link}    timeout=10

Verify sharing functionality of video
    Wait Until Element Is Visible   ${login_skip_button}   timeout=30
    Click Element    ${login_skip_button}
    Wait Until Page Contains Element    ${clips_link}  timeout=30
    Click Element    ${clips_link}
    Wait Until Page Contains Element    ${clips_like_button}    timeout=10
    Wait Until Page Contains Element    ${video_sharebutton}    timeout=30
    Click Element    ${video_sharebutton}
    Wait Until Page Contains Element    ${home_link}    timeout=10
    Sleep    5


Verify if user is able to filter the fixtures on webview screen
    Wait Until Page Contains Element    ${fixtures_link}  timeout=30
    Click Element    ${fixtures_link}
    Sleep    5
    Swipe Up Until Element Is Visible    ${filters_button}
    Wait Until Element Is Visible    ${filters_button}  timeout=30
    Click Element    ${filters_button}
    Wait Until Element Is Visible    ${filtures_homepage}   timeout=30
    Click Element    ${filter_by_teams_button}
    Click Element   ${All_optiion}
    Click Element    ${Apply_filters_button}
    Wait Until Element Is Visible    ${matchcentre_btn}   timeout=30
    Check All Matches Visible
    Sleep    5


Check All Matches Visible
     Swipe    ${341}    ${968}    ${393}    ${438}
     ${count}=    Set Variable    0
     ${expected_match_count}=    Evaluate    int(${expected_match_count})
     FOR    ${index}    IN RANGE    1    ${expected_match_count + 1}
        ${element}=    Evaluate    'xpath=(//android.widget.TextView[@text="MATCHCENTRE"])[' + str(${index}) + ']'
        Log  ${index}
        Log  ${matchcentre_btn}
        Log  ${element}
        ${result}   Run Keyword And Return Status    Wait Until Element Is Visible    xpath=${element}  timeout=30
        Should Be Equal    ${result}    ${True}
        ${count}=    Set Variable    ${index}
        Swipe Down Until Element Is Visible New   ${element}
     END
     Log To Console    ${count}
     Should Be Equal    ${expected_match_count}    ${count}



Verify If User Can Select Status Filter on Webview Screen
    Wait Until Element Is Visible    ${fixtures_link}   timeout=30
    Click Element    ${fixtures_link}
    Sleep    5
    Swipe Up Until Element Is Visible    ${filters_button}
    Wait Until Element Is Visible    ${filters_button}  timeout=30
    Click Element    ${filters_button}
    Wait Until Element Is Visible    ${filtures_homepage}   timeout=30
    Click Element    ${filter_by_status_button}
    Wait Until Element Is Visible    ${upcoming_option}
    Click Element    ${upcoming_option}
    Click Element    ${Apply_filters_button}
    Check KKR Upcoming Matches
    Sleep    5

Check KKR Upcoming Matches
    Wait Until Element Is Visible    ${upcoming_btn}    timeout=30
    Element Should Be Visible    ${upcoming_btn}
    Sleep    5



