*** Settings ***
Library  SeleniumLibrary
Library     ImapLibrary
Library    Collections
Library     robot.libraries.DateTime
Library    String
Variables  ../../PageObjects/Membership/membership_locators.py
Resource  ../../Resources/Membership/membership_keywords.robot
Resource  ../../Resources/Profile/profile_keywords.robot
Resource  ../../Resources/Login/login_keywords.robot
Resource    ../../../../CommonBase/Cms/Resources/otp_keywords.robot
Library   ../../../CommonKeywords/Utilities/user_keywords.py
Resource  ../../Resources/Gaming/gaming_keywords.robot
Variables   ../../PageObjects/Membership/membership_page_navigation_locators.py

*** Variables ***
${IMAP_HOST}          imap.gmail.com
${EMAIL_USERNAME}     pallavishelke932@gmail.com
${EMAIL_PASSWORD}     Pallavi@123
${EXPECTED_SUBJECT} =  Welcome Aboard To Our Newest Super Royal!
*** Keywords ***

verify next button to congratulations screen
    Click Element    ${next_btn_congrats_screen}

Verify 3 membership plan are display on screen
    Click Element    ${membership_name}
    Wait Until Element Is Visible    ${Pro_membership_title}    timeout=20s
    Mouse Down    ${Pro_membership_title}
    Sleep    2s
    Wait Until Element Is Visible    ${Elite_membership_title}  timeout=20s
    Mouse Down    ${Elite_membership_title}
    Sleep    2s
    Wait Until Element Is Visible        ${junior_membership_title}     timeout=20s
    Mouse Down    ${junior_membership_title}

Verify navigation to junior membership form
    Scroll Element Into View    ${gift_now_btn}
    Mouse Over    ${gift_now_btn}
    Click Element    ${gift_now_btn}

Verify navigation to pro membership form page
    Scroll Element Into View    ${Join_now_btn1}
    Mouse Over    ${Join_now_pro_elite}
    Click Element    ${Join_now_pro_elite}

Enter Required Details For Junior Membership
    Scroll Element Into View    ${step_1_txt}
    Wait Until Page Contains Element    ${step_1_txt}
    Sleep    20s
    Mouse Over    ${Junior_Firstname}
    Input Text    ${Junior_Firstname}    pallavi
    Mouse Over    ${junior_lastname}
    Input Text    ${junior_lastname}    shelke
    Mouse Over    ${junior_dob}
     Input Text    ${junior_dob}    12-06-2008
    Mouse Over    ${female_radio_btn}
    Click Element    ${female_radio_btn}
     Wait Until Element Is Visible    ${delivery_address}    20s
    Input Text    ${delivery_address}    Oyo Workflow Baner
    Scroll Element Into View    ${pincode_purchasemembership}
    Wait Until Element Is Visible   ${country_field}    30s
     Select From List By Label    ${country_field}      India
     Wait Until Element Is Enabled    ${state_field}     20s
    Sleep    5
    Select From List By Value    ${state_field}    Maharashtra
    Wait Until Element Is Visible   ${city_field}   10s
    Input Text    ${city_field}    Pune
    Capture Page Screenshot
    Wait Until Element Is Visible    ${pincode_purchasemembership}   5s
    Input Text    ${pincode_purchasemembership}    411045

Verify coupon code section on required feilds screen for membership plan
    Mouse Over    ${coupon_code}
    Page Should Contain Element   ${coupon_code}

Enter Required Details For Pro Membership
    Wait Until Element Is Visible    ${delivery_address}    20s
    Input Text    ${delivery_address}    Oyo Workflow Baner
    Scroll Element Into View    ${pincode_purchasemembership}
    Wait Until Element Is Visible   ${country_field}    30s
     Select From List By Label    ${country_field}      India
     Wait Until Element Is Enabled    ${state_field}     20s
    Sleep    5
    Select From List By Value    ${state_field}    Maharashtra
    Wait Until Element Is Visible   ${city_field}   10s
    Input Text    ${city_field}    Pune
    Capture Page Screenshot
    Wait Until Element Is Visible    ${pincode_purchasemembership}   5s
    Input Text    ${pincode_purchasemembership}    411045
     Wait Until Element Is Visible    ${jerseysize_loc}     5s
    Select From List By Label   ${jerseysize_loc}    T-Shirt Size S
    Capture Page Screenshot


Enter data in coupon feild for junior membership plan
    Mouse Over    ${coupon_code}
    Input Text    ${coupon_code}    COMJUN
    Mouse Over    ${discount_apply}
    Click Element    ${discount_apply}
    Wait Until Element Is Visible    ${discount_msg_junior}   timeout=10s

Enter Unique coupon code in coupon code feild for junior membership plan
    Mouse Over    ${coupon_code}
    Input Text    ${coupon_code}    UNIJUN
    Mouse Over    ${discount_apply}
    Click Element    ${discount_apply}
    Wait Until Element Is Visible    ${discount_msg_one_time}   timeout=10s

Enter data in coupon feild for pro membership plan
    Mouse Over    ${coupon_code}
    Input Text    ${coupon_code}    COMPRO
    Click Element    ${discount_apply}
    Wait Until Element Is Visible  ${discount_msg}

Enter data in coupon feild for 100% off on membership plan
    Mouse Over    ${coupon_code}
    Input Text    ${coupon_code}    SIUNIQUE
    Click Element    ${discount_apply}
    Page Should Contain Element   ${discount_msg}

Verify 10% discount for coupon code
    Wait Until Element Is Visible    ${bankloc}     30s
    Sleep    10s
    Scroll Element Into View    ${Discounted_price}
    Wait Until Element Is Enabled    ${Discounted_price}    30s
    Page Should Contain Element    ${Discounted_price}


Submit the data and proceed to payment option
     Wait Until Element Is Visible    ${purchasemembership_btn}   5s
    Click Element    ${purchasemembership_btn}

verify payment process for membership plan
    Wait Until Element Is Visible    ${bankloc}
    Mouse Over    ${bankloc}
    Click Element    ${bankloc}
    Mouse Over    ${netbank_dropdown}
    Click Element    ${netbank_dropdown}
    Click Element    ${bank_name}

Verify invoice creation of payment
    Mouse Over    ${make_payment}
    Click Element    ${make_payment}
    Wait Until Page Contains Element    ${send_response}
    Click Element    ${send_response}
    Wait Until Page Contains Element    ${transaction_Done}
    Click Element    ${transaction_Done}

verify membership plan purchase button is disable
    Wait Until Page Contains Element    ${membership_name}
    Click Element    ${membership_name}
    Wait Until Element Is Visible    ${Gift_now_disable_btn}    timeout=20s
    Scroll Element Into View    ${Gift_now_disable_btn}


Verify logout button of website
    Wait Until Element Is Visible    ${profile_btn}     timeout=10s
    Mouse Over    ${profile_btn}
    Click Element    ${profile_btn}
    Mouse Over    ${logout_btn}
    Click Element    ${logout_btn}
    Wait Until Element Is Visible    ${login_button}    timeout=10s

Verify state and city as per pincode
    Wait Until Page Contains Element    ${pincode_field}    timeout=20
    Input Text    ${pincode_field}    400078
    Scroll Element Into View    ${submit_button}
    Press Keys    ${pincode_field}    \ue007  # Simulate "Enter" key press to submit
    ${city_text}=    Execute JavaScript    return document.querySelector('${city_field}').value
    Wait Until Element Contains   ${city_text} == 'Mumbai'    timeout=20
    Wait Until Element Contains    ${state_field}    MAHARASHTRA    timeout=20

verify delete all emails
         Delete All Emails Inbox    imap.gmail.com    993    pallavishelke932@gmail.com    hwjc fcce stvk kwej
         Log    deleted all mails

Verify Email
     ${body}=  Search And Fetch Email    imap.gmail.com    993    pallavishelke932@gmail.com    hwjc fcce stvk kwej    Welcome Aboard To Our Newest Super Royal!
     Log    ${body}
#     ${d}=    get time
#     log    {d}
#     ${d}=    Get Current Date    result_format=%Y-%m-%d
#     log    {d}


