*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    ../../../../../CommonBase/Utilities/user_keywords.py
Resource    ../FLRP/flrp_keywords.robot
Resource    ../Login/login_keywords.robot
Variables   ../../PageObjects/Login/login_locators.py
Variables   ../../PageObjects/HomeScreen/home_screen_locators.py
Variables   ../../PageObjects/CometChat/comet_chat_locators.py


*** Keywords ***
Join N Fan Chat Groups
    [Arguments]    ${number}
    FOR    ${count}    IN RANGE   1    ${number}+1
        swipe up until element is visible    ${first_join_button}
        click element    ${first_join_button}
        wait until element is visible    ${message_list}
        wait until element is visible    ${send_button}
        click element    accessibility_id=${back_icon_id}
    END

Join A Group If Not Joined Any And Open Chat
    ${status}    run keyword and return status    wait until element is visible   ${first_join_button}
    IF    ${status}
        log to console    Already Joined One
        click element    ${first_join_button}
    ELSE
        wait until element is visible    ${first_join_button}
        click element    ${first_join_button}
    END
    wait until element is visible    accessibility_id=${gify_icon}

Verify User Can React On The Last Message
    [Arguments]    ${count}
    long press    //XCUIElementTypeTable/XCUIElementTypeCell[${count}]
    wait until element is visible    ${laughing_emoji}
    click element    ${laughing_emoji}


Verify User Can Reply Last Message With Comment
    [Arguments]     ${count}    ${comment}
    long press    //XCUIElementTypeTable/XCUIElementTypeCell[${count}]
    wait until element is visible   accessibility_id=${reply_message_id}
    click element    accessibility_id=${reply_message_id}
    wait until element is visible    accessibility_id=${reply_message_close_cirle_id}
    wait until element is visible    ${comment_field}    #write comment
    input text   ${comment_field}   ${comment}
    click element    accessibility_id=${done_id}
    click element    accessibility_id=${send_icon_id}

Verify Sent Message
    [Arguments]    ${expected_message}
    ${count}    get matching xpath count    ${messages}
    ${actual_message}   get text    //XCUIElementTypeTable/XCUIElementTypeCell[${count}]/XCUIElementTypeStaticText[1]
    should be equal    ${actual_message}    ${expected_message}

Click On Joined Button
    wait until element is visible    ${first_join_button}    timeout=10
    click element    ${first_join_button}

Leave N Fan Chat Groups
    [Arguments]    ${number}
    swipe up until element is visible    ${first_joined_button}
    click element    ${first_joined_button}
    wait until element is visible     ${group_icon}
    click element    ${group_icon}
    wait until element is visible    accessibility_id=${close_button_id}
    swipe up until element is visible    accessibility_id=${leave_group_id}
    click element    accessibility_id=${leave_group_id}
    wait until element is visible    accessibility_id=${leave_button_id}
    click element    accessibility_id=${leave_button_id}
    wait until element is visible    ${fan_chat}
    click element    ${fan_chat}


Verify Admin | Moderator Can Send Photo | Video In Group
    wait until page contains element    accessibility_id=${add_club_button_id}    timeout=30
    Click Element    ${add_club_button_id}
    wait until page contains element    accessibility_id=${photo_gallery_id}    timeout=30
    Click Element    ${photo_gallery_id}
    wait until page contains element    accessibility_id=Screenshot, 16 May, 3:08 PM    ##this has to be dynamic
    Click Element    accessibility_id=Screenshot, 16 May, 3:08 PM
    wait until page contains element    accessibility_id=${just_now_id}    timeout=30

Verify Admin | Moderator Can Create Poll In Group
    [Arguments]    ${data}
    wait until page contains element     accessibility_id=${add_club_button_id}
    Click Element    ${add_club_button_id}
    wait until page contains element    accessibility_id=${create_poll_id}
    Click Element    ${create_poll_id}
    wait until page contains element    ${enter_question_field}
    Input Text    ${enter_question_field}     ${data.question}
    Input Text    ${enter_option_field}     ${data.option1}
    Input Text    ${enter_option_field}     ${data.option2}
    wait until page contains element     accessibility_id=${done_id}
    Click Element    accessibility_id=${done_id}
    wait until element is visible    xpath=//XCUIElementTypeStaticText[@name="Create${SPACE}${SPACE}Poll"]
    Click Element    xpath=//XCUIElementTypeStaticText[@name="Create${SPACE}${SPACE}Poll"]
    wait until page contains element    accessibility_id=${data.question}    timeout=30
    wait until element is visible     accessibility_id=${data.option1}
    wait until element is visible     accessibility_id=${data.option2}

Verify Admin Can Ban Any Member
    [Arguments]    ${member}
    wait until element is visible     ${group_icon}
    click element    ${group_icon}
    wait until element is visible    accessibility_id=${close_button_id}
    swipe up until element is visible    //XCUIElementTypeStaticText[@name="${member}"]
    long press    //XCUIElementTypeStaticText[@name="${member}"]
    wait until element is visible    accessibility_id=${ban_member_button_id}
    click element    accessibility_id=${ban_member_button_id}
    wait for 5 seconds
    page should not contain element    //XCUIElementTypeStaticText[@name="${member}"]

Verify Admin Can Remove Any Member
    [Arguments]    ${member}
    wait until element is visible    //XCUIElementTypeStaticText[@name="${member}"]
    long press    //XCUIElementTypeStaticText[@name="${member}"]
    wait until element is visible    accessibility_id=${remove_member_button_id}
    click element    accessibility_id=${remove_member_button_id}
    page should not contain element    //XCUIElementTypeStaticText[@name="${member}"]

Verify Admin Can Promote Participant
    [Arguments]    ${member}
    wait until element is visible     ${group_icon}
    click element    ${group_icon}
    wait until element is visible    accessibility_id=${close_button_id}
    wait until element is visible    accessibility_id=${administrator_button_id}
    wait until element is visible    accessibility_id=${moderator_button_id}
    click element    accessibility_id=${administrator_button_id}
    wait until element is visible    accessibility_id=${add_admin_button_id}
    click element    accessibility_id=${add_admin_button_id}
    wait until element is visible    xpath=(//XCUIElementTypeStaticText[@name="${member}"])[2]
    long press    xpath=(//XCUIElementTypeStaticText[@name="${member}"])[2]
    wait until element is visible    accessibility_id=${assign_admin_button_id}
    click element    accessibility_id=${assign_admin_button_id}

Click On Fan Chat Buttom
    wait until page contains element    ${fan_chat}     timeout=30
    click element    ${fan_chat}

Send GIF In Group Chat
    wait until element is visible     accessibility_id=${gify_icon}
    click element    accessibility_id=${gify_icon}
    wait until element is visible    ${first_gif_image}    timeout=30
    click element    ${first_gif_image}
    wait until element is visible    accessibility_id=${send_icon_id}
    wait until element is visible    accessibility_id=${just_now_id}

Search Group Name
    [Arguments]    ${name}
    wait until element is visible    accessibility_id=${search_button_id}
    click element    accessibility_id=${search_button_id}
    wait until element is visible    ${search_field}
    input text    ${search_field}    ${name}
    wait until element is visible    ${search_button}
    click element    ${search_button}

Verify Search Functionality Of Comet Chat
    [Arguments]    ${name}
    ${element_count}    get matching xpath count    ${group_list_section}
    IF    ${element_count}==0
        page should contain element    accessibility_id=${no_club_found_id}
    ELSE
        sleep    5
        FOR    ${i}    IN RANGE    1    ${element_count}+1
            ${group_name}    get text    //XCUIElementTypeTable/XCUIElementTypeCell[${i}]/XCUIElementTypeStaticText
            should contain    ${group_name}    ${name}
        END
    END

Verify Ban User Can't Join Group
    [Arguments]    ${group_name}
    wait until element is visible    //XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText[@name="${group_name}"]//following-sibling::XCUIElementTypeButton[@name="JOIN"]
    click element    //XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText[@name="${group_name}"]//following-sibling::XCUIElementTypeButton[@name="JOIN"]
    wait until element is visible    accessibility_id=The user with UID 919000000038 is banned from a group with GUID 1001.
