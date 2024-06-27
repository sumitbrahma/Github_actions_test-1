*** Settings ***
Library  SeleniumLibrary
Library    String
Variables  ../../PageObjects/Membership/membership_locators.py
Variables  ../../PageObjects/Login/login_page_locators.py
Resource    ../Fixtures and Results/fixturesresults_keywords.robot
Resource    membership_page_navigation.robot

*** Keywords ***
Verify Membership Plan In Card Format
    Scroll Element Into View    ${purchase_membership_heading}
    Wait Until Page Contains Element    ${elite_membership_card}    timeout=30
    Wait Until Page Contains Element    ${pro_membership_card}
    Wait Until Page Contains Element    ${junior_membership_card}
    Capture Page Screenshot

Verify Skip Step 3
    Wait Until Element Is Visible    ${skip_button}
    Click Element    ${skip_button}
    Wait Until Page Contains Element    ${next_button}  timeout=30

Select Pro Membership Plan
    Wait Until Element Is Visible    ${pro_membership_card}
    Click Element    ${pro_membership_card}

Select Elite Membership Plan
    Wait Until Element Is Visible    ${elite_membership_card}   30s
    Click Element    ${elite_membership_card}
    Capture Page Screenshot

Enter Required Details For Membership
    Scroll Element Into View    ${delivery_address}
    Wait Until Element Is Visible    ${delivery_address}    20s
    Input Text    ${delivery_address}    Oyo Workflow Baner
    Scroll Element Into View    ${pincode_purchasemembership}
    Wait Until Element Is Visible   ${country_field}    30s
    Click Element    ${country_field}
    Select From List By Label    ${country_field}      India
    Click Element    ${country_field}
    Wait Until Element Is Enabled    ${state_field}     20s
    Sleep    5
    Select From List By Value    ${state_field}    Maharashtra
    Wait Until Element Is Visible   ${city_field}   30s
    Input Text    ${city_field}    Pune
    Capture Page Screenshot
    Wait Until Element Is Visible    ${pincode_purchasemembership}   5s
    Input Text    ${pincode_purchasemembership}    411045
    Wait Until Element Is Visible    ${jerseysize_loc}     5s
    Select From List By Label   ${jerseysize_loc}    T-Shirt Size S
    Capture Page Screenshot
    Wait Until Element Is Visible    ${purchasemembership_btn}   5s
    Click Element    ${purchasemembership_btn}

Verify If User Selectes Pro Plan And Fill The Required Detail
    Wait Until Element Is Enabled    ${bankloc}    30s
    Click Element    ${bankloc}
    Wait Until Element Is Visible    ${netbank_dropdown}    30s
    Select From List By Label    ${netbank_dropdown}     Avenues Test for New TC
    Wait Until Element Is Visible    ${make_payment}     30s
    Click Element    ${make_payment}
    Capture Page Screenshot
    Wait Until Element Is Enabled    ${send_response}   30s
    Click Element    ${send_response}
    Capture Page Screenshot

Verify User Should Redirect To Payment Gateway Screen
    Wait Until Element Is Visible    ${success_message}     30s
    Wait Until Element Is Visible    ${payment_done}    5s
    Click Element    ${payment_done}
    Capture Page Screenshot

User Should Get Redirected To Purchase Membership Screen
    Page Should Contain Element    ${purchasemembership_txt}
    Wait Until Page Contains Element    ${purchasemembership_txt}

User Should Get Redirected To Congratulations Screen
    Wait Until Page Contains Element    ${congratualtion_txt}     timeout=20s
    Page Should Contain Element  ${congratualtion_txt}


Select Membership Plan
    [Arguments]    ${membership}
    Sleep    30s
    ${dynamic_xpath}    Replace String    ${dynamicmembership}    membership-type    ${membership}
    Scroll Element Into View    ${dynamic_xpath}
    Wait Until Element Is Visible    ${dynamic_xpath}      timeout=30s
    Click Element    ${dynamic_xpath}
    ${status}    ${result}    Run Keyword And Ignore Error   Wait Until Element Is Visible   ${Junior_Firstname}    timeout=20
    Run Keyword If    '${status}' == 'PASS'    Enter Junior Membership Data And Purchase
    ...    ELSE    Enter Required Details For Membership
    [Return]    ${dynamic_xpath}


Enter Junior Membership Data And Purchase
    Enter Required Details For Junior Membership
    Submit the data and proceed to payment option


Select Second Membership Plan
    Click Element    ${membership_name}
    Wait Until Element Is Visible    ${Pro_membership_title}    timeout=20s
    Wait Until Element Is Visible    ${purchasemembership_joinbtn}      timeout=30s
    Click On Particular Element     ${purchasemembership_joinbtn}
    Sleep    5s

