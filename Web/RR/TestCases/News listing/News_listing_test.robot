*** Settings ***
Library  SeleniumLibrary
#Library  DataDriver  path fof testcdatasheet
Resource  ../../Resources/Membership/membership_keywords.robot
Resource  ../../Resources/Profile/profile_keywords.robot
Resource  ../../Resources/Login/login_keywords.robot
Resource    ../../../../CommonBase/Cms/Resources/otp_keywords.robot
Resource    ../../Resources/Gaming/gaming_keywords.robot
Resource    ../../Resources/News and Listing/news_listing_keywords.robot
Resource    ../../Resources/Fixtures and Results/fixturesresults_keywords.robot

Test Setup      Launch Application
Test Teardown   Close Browser

*** Test Cases ***
Verify The Filter Functionality By Year
    Select Value From Nav Dropdown  ${latestnav}     ${newsoption}
    Click On Share Icon For Any Article
    Click On Particular Element    ${twitter_option}
    Social Icons Option Is Visible
    Click On ClipBoard Icon