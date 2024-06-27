*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Membership/membership_keywords.robot
Resource  ../../Resources/Profile/profile_keywords.robot
Resource  ../../Resources/Login/login_keywords.robot
Resource  ../../../../CommonBase/Cms/Resources/otp_keywords.robot
Resource   ../../Resources/Gaming/gaming_keywords.robot
Resource   ../../Resources/Fixtures and Results/fixturesresults_keywords.robot
Resource   ../../Resources/Standings/standings_keywords.robot

Test Setup      Launch Application
Test Teardown   Close Browser

*** Test Cases ***
Verify Accordion Functionality
    Select Value From Nav Dropdown  ${ipl_titlenav}     ${ipldropdown_val}
    Click On Accordion
    Able To See Latest 3 Matches For Team Stands And Scorecard Text

Verify The Functionality Of Latest Match Card Redirection
    Select Value From Nav Dropdown  ${ipl_titlenav}     ${ipldropdown_val}
    Click On Accordion
    ${text1}    Click On First Match Card
    Redirect To Rescpective Match Center Screen
