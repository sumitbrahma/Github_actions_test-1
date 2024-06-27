** Settings ***
Library  SeleniumLibrary
Resource  ../Login/login_keywords.robot
Variables  ../../PageObjects/Login/login_page_locators.py
Variables  ../../PageObjects/Fixtures and Results/fixturesresults_locators.py
Variables  ../../PageObjects/Gaming/gaming_locators.py

*** Variables ***
${currentpage_url}  https://stg-rr.sportz.io/schedule-fixtures-results

*** Keywords ***
Select Value From Nav Dropdown
    [Arguments]     ${navval}   ${dropdown_val}
    Wait Until Element Is Not Visible    ${playnow_btn}    timeout=30s
    ${SELENIUM_SPEED}   Get Selenium Speed
    Set Selenium Speed    ${SELENIUM_SPEED}
    Wait Until Element Is Not Visible    ${playnow_btn}    timeout=30s
    Wait Until Element Is Visible    ${navval}   timeout=30s
    Click Element    ${navval}
    Wait Until Element Is Enabled   ${dropdown_val}     timeout=30s
    Click Element    ${dropdown_val}

Click On Filter Icon Which Is Floating
    Sleep    15s
    Wait Until Element Is Visible    ${filter_iplpage}      timeout=30s
    Wait Until Keyword Succeeds    5x     4s   Click Element    ${filter_iplpage}

Click On IPL Dropdown For Filteration
    [Arguments]     ${filtervalue}
    Wait Until Element Is Enabled    ${filtervalue}     timeout=30s
    Click Element    ${filtervalue}

Select Option From Dropdown
    [Arguments]     ${dropdownval}
    Wait Until Element Is Visible    ${dropdownval}  timeout=30s
    Click Element    ${dropdownval}
    
Click On Apply Filter Button
    Wait Until Element Is Visible    ${apply_filteroption}  timeout=30s
    Click Element    ${apply_filteroption}
    Sleep    2s

URL Change And Updated For Ipl Page
    ${expected_url}    Set Variable    ${currentpage_url}
    ${current_url}    Get Location
    Should Be Equal As Strings    ${expected_url}    ${current_url}
    Click On Apply Filter Button
    ${new_url}    Get Location
    Should Not Be Equal As Strings    ${expected_url}    ${new_url}

Fixtures And Results 2023 Will Show With Recent lable
    Wait Until Page Contains Element  ${ipl_data2023}     timeout=30s
    Page Should Contain Element    ${ipl_data2023}

View Only Team Fixtures
    [Arguments]     ${team}
    ${count}    Get Element Count    ${team}
    FOR    ${counter}    IN RANGE    0    ${count}+1
        Wait Until Page Contains Element    ${kkr_text}    timeout=30s
        Page Should Contain Element    ${kkr_text}
    END

View Only Upcoming Matches Of Rajasthan Royals
    ${count}    Get Element Count   ${filter_upcomingtxt}
    FOR    ${element}    IN    0    ${count}+1
        Wait Until Page Contains Element    ${filter_upcomingtxt}     timeout=30s
        Page Should Contain Element    ${filter_rrtxt}
    END

Click On Particular Element
    [Arguments]     ${element}
    Wait Until Keyword Succeeds    3    3    Wait Until Element Is Visible    ${element}
    Wait Until Keyword Succeeds    3    3    Click Element    ${element}