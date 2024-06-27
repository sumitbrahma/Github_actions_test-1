*** Settings ***
Library  SeleniumLibrary
Variables  ../../PageObjects/News and Listing/news_listing_locators.py
Variables  ../../PageObjects/Login/login_page_locators.py
Resource    ../Fixtures and Results/fixturesresults_keywords.robot

*** Keywords ***
Click On Share Icon For Any Article
    Sleep    5s
    Click On Particular Element     ${shareoption_newspage}

Social Icons Option Is Visible
    ${count}    Get Element Count   ${social_iconloc}
    FOR   ${counter}    IN RANGE   0    ${count}+1
        Wait Until Page Contains Element    ${social_iconloc}    timeout=10
        Page Should Contain Element    ${social_iconloc}
    END

Click On ClipBoard Icon
    Click On Particular Element    ${copylink_option}

