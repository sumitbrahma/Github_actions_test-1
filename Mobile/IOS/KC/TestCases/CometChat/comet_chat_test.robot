*** Settings ***
Library   AppiumLibrary
Library    OperatingSystem
Resource    ../../Resources/Login/login_keywords.robot
Resource    ../../Resources/FLRP/flrp_keywords.robot
Resource    ../../Resources/CometChat/comet_chat_keywords.robot
Variables    ../../PageObjects/CometChat/comet_chat_locators.py

Test Setup        Open KC application
Test Teardown    Close Application

*** Variables ***
${testdata}    ${CURDIR}${/}..${/}..${/}TestData${/}comet_chat_testdata.xlsx

*** Test Cases ***
Verify registered user can join N number of clubs in the given club list
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata}    1
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_number}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Click On Skip Button If Visible
    Click On Fan Chat Buttom
    Join N Fan Chat Groups    ${data.groups_to_join}

Verify any members can send gif file
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata}    2
#    Verify Login Screen
#    Enter Mobile Number    ${data.mobile_number}
#    Click On Request Otp Button
#    Enter Otp    ${data.otp}
#    Click On Skip Button If Visible
    Click On Fan Chat Buttom
    Join A Group If Not Joined Any And Open Chat
    Send GIF In Group Chat

Verify club search functionality
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata}    3
#    Verify Login Screen
#    Enter Mobile Number    ${data.mobile_number}
#    Click On Request Otp Button
#    Enter Otp     ${data.otp}
#    Click On Skip Button If Visible
    Click On Fan Chat Buttom
    Search Group Name     ${data.search_group}
    sleep    2
    Verify Search Functionality Of Comet Chat    ${data.search_group}

Verify any member can react, in-reply message and see message information
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata}    4
#    Verify Login Screen
#    Enter Mobile Number    ${data.mobile_number}
#    Click On Request Otp Button
#    Enter Otp    ${data.otp}
#    Click On Skip Button If Visible
    Click On Fan Chat Buttom
    Join A Group If Not Joined Any And Open Chat
    sleep    5
    ${count}    get matching xpath count    ${message_section}
    Verify User Can React On The Last Message    ${count}
    sleep    2
    ${count}    get matching xpath count    ${message_section}
    Verify User Can Reply Last Message With Comment    ${count}    ${data.message}
    sleep    2
    Verify Sent Message    ${data.message}

Verify any member can leave the group
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata}    5
#    Verify Login Screen
#    Enter Mobile Number    ${data.mobile_number}
#    Click On Request Otp Button
#    Enter Otp    ${data.otp}
#    Click On Skip Button If Visible
    Click On Fan Chat Buttom
    Leave N Fan Chat Groups    ${data.groups_to_leave}
    Click On Back Button
    get tokens earned
    logout from app

Verify only moderator, admin can send the photos/videos, create the poll, pin the message
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata}    6
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_number}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Click On Skip Button If Visible
    Click On Fan Chat Buttom
    Click On Joined Button
    Verify Admin | Moderator Can Send Photo | Video In Group
    Verify Admin | Moderator Can Create Poll In Group    ${data}


Verify admin can ban and remove any member in a club except admin and owner
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata}    7
#    Verify Login Screen
#    Enter Mobile Number    ${data.mobile_number}
#    Click On Request Otp Button
#    Enter Otp    ${data.otp}
#    Click On Skip Button If Visible
    Click On Fan Chat Buttom
    Click On Joined Button
    Verify Admin Can Ban Any Member    ${data.ban_member}
    Verify Admin Can Remove Any Member    ${data.remove_member}


Verify only admin can promote demote participant, moderator and admin
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata}    8
#    Verify Login Screen
#    Enter Mobile Number    ${data.mobile_number}
#    Click On Request Otp Button
#    Enter Otp    ${data.otp}
#    Click On Skip Button If Visible
    Click On Fan Chat Buttom
    Click On Joined Button
    Verify Admin Can Promote Participant    ${data.promote_member}


Verify ban members can't join the same group , unless those ban members is unban
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata}    9
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_number}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Click On Skip Button If Visible
    Click On Fan Chat Buttom
    Verify Ban User Can't Join Group    Fan Group 1