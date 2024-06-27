*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    ../../../../../CommonBase/Utilities/user_keywords.py
Resource    ../FLRP/flrp_keywords.robot
Variables   ../../PageObjects/Login/login_locators.py
Variables   ../../PageObjects/Fixtures/fixtures_locators.py
Variables   ../../PageObjects/HomeScreen/home_screen_locators.py


*** Keywords ***
Click On Fixtures Button
    wait until page contains element    ${fixtures_button}    timeout=30
    click element    ${fixtures_button}
    wait until page contains    VS    timeout=30

Click On Add To Calender On Home Screen
    wait until page contains element    ${home_add_to_calender}    timeout=30
    Click Element     ${home_add_to_calender}

Click On Add To Calender On Fixtures Screen
    swipe down until element is visible    ${fixtures_add_to_calender}
    click element    ${fixtures_add_to_calender}

Click On Matchcenter Button On And Verify Details
    wait until page contains element    ${matchcenter_button}    timeout=10
    click element    ${matchcenter_button}
    wait until page contains    Match

Verify Add To Calender Functionality
    [Arguments]    ${email}    ${password}
    wait until page contains element     ${google_text}    timeout=30
    Click Element    ${google_text}
    ${status}    run keyword and return status   wait until page contains element    ${use_another_acc_field}
    IF    ${status}
        click element    ${use_another_acc_field}
    END
    wait until page contains element    accessibility_id=${email_or_phone_field_id}
    click element    accessibility_id=${email_or_phone_field_id}
    Input Text    accessibility_id=${email_or_phone_field_id}    ${email}
    click element    ${done_button_email_field}
    wait until page contains element    ${next_button}
    click element    ${next_button}
    ${status}    run keyword and return status    wait until page contains element    accessibility_id=${continue_id}
    IF    ${status}
        click element    accessibility_id=${continue_id}
        sleep    1
        click element    accessibility_id=${continue_id}
    ELSE
        wait until page contains element    accessibility_id=${password_field_id}
        click element    accessibility_id=${password_field_id}
        Input Text    accessibility_id=Enter your password    ${password}
        Click Element    ${done_button_email_field}
        wait until page contains element    accessibility_id=${next_button_id}
        Click Element     accessibility_id=${next_button_id}
        wait until page contains element    accessibility_id=${continue_id}
        Click Element    accessibility_id=${continue_id}
        sleep    1
        swipe up until element is visible    accessibility_id=${continue_id}
        Click Element    accessibility_id=${continue_id}
        wait until page contains    ${calendar_sync_message}    timeout=30
    END

