*** Settings ***
Library  SeleniumLibrary
Resource  ../Login/login_keywords.robot
Variables  ../../PageObjects/Login/login_page_locators.py

*** Keywords ***
Verify all fields on incomplete profile
    Wait Until Page Contains Element   ${first_name_field}   60s
    Wait Until Page Contains Element    ${last_name_field}
    Wait Until Page Contains Element    ${country_dropdown}
    Wait Until Page Contains Element    ${gender_female_radio_button}
    Wait Until Page Contains Element    ${date_of_birth_field}
    Wait Until Page Contains Element    ${submit_button}
    Wait Until Page Contains Element    ${terms_checkbox}

Fill all the manadatory Fields for creating the Profile Page
    [Arguments]  ${user_data}
    Sleep    10
    Wait Until Element Is Visible   ${first_name_field}   60s
    Input Text    ${first_name_field}   ${user_data.first_name}
    Wait Until Element Is Visible    ${last_name_field}   30s
    Input Text  ${last_name_field}    ${user_data.last_name}
    Verify Email Id field   ${user_data.email_id}
    Wait Until Element Is Visible   ${country_dropdown}    30s
    Click Element    ${country_dropdown}
    Select From List By Label    ${country_dropdown}      ${user_data.country}
    Verify & Enter pin code field    ${user_data.pin_code}
    ${gender}   replace string  ${gender_female_radio_button}  gender   ${user_data.gender}
    Click Element     ${gender}
    Wait Until Element Is Visible    ${date_of_birth_field}
    Input Text    ${date_of_birth_field}     ${user_data.date_of_birth}
    Sleep    5s
    Scroll Element Into View    ${submit_button}
    Press Keys  ${terms_checkbox}  Enter

Verify & Enter pin code field
    [Arguments]    ${pin_code}
    Wait Until Element Is Enabled    ${pincode_field}   timeout=20
    Input Text    ${pincode_field}    ${pin_code}

Fill all fields in profile fields For Registration
    [Arguments]  ${email}
    Sleep    8
    Wait Until Element Is Visible   ${first_name_field}   60s
    Input Text    ${first_name_field}   Rkhadc
    Wait Until Element Is Visible    ${last_name_field}   30s
    Input Text  ${last_name_field}    oiuti
    Capture Page Screenshot
    Verify Email Id field   ${email}
    Wait Until Element Is Visible   ${country_dropdown}    30s
    Click Element    ${country_dropdown}
    Capture Page Screenshot
    Select From List By Label    ${country_dropdown}      India
    Click Element    ${country_dropdown}
    User Is Able To Fill Pin Code
    Sleep    5s
    Click Element    ${gender_female_radio_button}
    Wait Until Element Is Visible    ${date_of_birth_field}
    Input Text    ${date_of_birth_field}    06/17/2000
    Capture Page Screenshot
    Wait Until Element Is Visible    ${submit_button}   timeout=30s
    Scroll Element Into View    ${submit_button}
    Press Keys  ${terms_checkbox}  Enter
    Sleep    5s
    Capture Page Screenshot
    Able To View Maharastra As State And Mumbai As City
    Capture Page Screenshot

Click And Verify Submit Button
    Sleep    5
    Wait Until Element Is Visible    ${submit_button}  20s
    Click Element    ${submit_button}
    Wait Until Page Contains Element    ${purchase_membership_heading}  timeout=30

