*** Settings ***
Library  SeleniumLibrary
Variables  ../../PageObjects/Membership/membership_locators.py
Variables  ../../PageObjects/Login/login_page_locators.py
Variables  ../../PageObjects/Gaming/gaming_locators.py

*** Keywords ***
Click On Quizzer From Menu
    Sleep    8s
    Wait Until Element Is Not Visible    ${playnow_btn}    20s
    ${SELENIUM_SPEED}   Get Selenium Speed
    Set Selenium Speed    ${SELENIUM_SPEED}
    Wait Until Element Is Not Visible    ${playnow_btn}    20s
    Wait Until Element Is Visible    ${fanzone_dropdown}   10s
    Click Element    ${fanzone_dropdown}
    Wait Until Element Is Enabled   ${fanzone_val}     10s
    Click Element    ${fanzone_val}

User Shouldn't Ask For Login Again Will Able To View Play Now Button
    Page Should Not Contain Element    ${first_name_field}
    Wait Until Element Is Visible    ${playnow_btn}      10s

CLick On Quizzer Menu Without Login
    Wait Until Element Is Visible    ${login_button_quizzer}    10s
    Click Element    ${login_button_quizzer}

Getting Login Screen And Play Now Button
    Wait Until Element Is Not Visible    ${first_name_field}    30s
    Page Should Not Contain Element    ${last_name_field}
    Wait Until Element Is Visible    ${playnow_btn}      30s