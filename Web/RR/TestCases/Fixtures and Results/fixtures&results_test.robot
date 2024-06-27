*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Membership/membership_keywords.robot
Resource  ../../Resources/Profile/profile_keywords.robot
Resource  ../../Resources/Login/login_keywords.robot
Resource    ../../../../CommonBase/Cms/Resources/otp_keywords.robot
Resource    ../../Resources/Gaming/gaming_keywords.robot
Resource    ../../Resources/Fixtures and Results/fixturesresults_keywords.robot

Test Setup      Launch Application
Test Teardown   Close Browser

*** Test Cases ***
Verify The Filter Functionality By Year
    Select Value From Nav Dropdown  ${ipl_titlenav}     ${matchesdropdown_val}
    Click On Filter Icon Which Is Floating
    Click On IPL Dropdown For Filteration   ${filter_year}
    Select Option From Dropdown      ${ipl_yeardropdownval}
    URL Change And Updated For Ipl Page
    Fixtures And Results 2023 Will Show With Recent lable

Verify The Filter Functionality By Teams
    Select Value From Nav Dropdown  ${ipl_titlenav}     ${matchesdropdown_val}
    Click On Filter Icon Which Is Floating
    Click On IPL Dropdown For Filteration   ${filter_team}
    Select Option From Dropdown    ${filter_teamval}
    Click On Apply Filter Button
    View Only Team Fixtures     ${kkr_text}

Verify The Filter Functionlity By Status
    Select Value From Nav Dropdown  ${ipl_titlenav}     ${matchesdropdown_val}
    Click On Filter Icon Which Is Floating
    Click On IPL Dropdown For Filteration   ${filter_status}
    Select Option From Dropdown    ${filter_statusval}
    Click On Apply Filter Button
    View Only Upcoming Matches Of Rajasthan Royals

Verify Reset Filter Functionality
    Select Value From Nav Dropdown  ${ipl_titlenav}     ${matchesdropdown_val}
    Click On Filter Icon Which Is Floating
    Click On IPL Dropdown For Filteration   ${filter_status}
    Select Option From Dropdown    ${filter_statusval}
    Click On Apply Filter Button
    Capture Page Screenshot
    Reload Page
    Click On Filter Icon Which Is Floating
    Click On Particular Element    ${filter_resetbtn}
    Capture Page Screenshot
    View Only Team Fixtures     ${filter_rrtxt}