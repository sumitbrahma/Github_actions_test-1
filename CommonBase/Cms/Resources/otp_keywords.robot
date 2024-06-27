*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Variables  ../../../Downloads/Downloads.py
Library    ../../Utilities/user_keywords.py
Variables  ../PageObjects/cms_locators.py

*** Variables ***
${web_environment}  ${CURDIR}${/}..${/}..${/}..${/}Environment${/}web_environment.json

*** Keywords ***
Open CMS for RR
    Sleep    2
    ${env_data}  Get Environment Data    ${web_environment}
    ${env_data}  Create Dictionary  &{env_data}
    ${options} =  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    ${prefs}  Create Dictionary  download.default_directory=${default_download_path}
    Call Method  ${options}  add_experimental_option  prefs  ${prefs}
    Call Method  ${options}  add_argument  headless
    Open Browser     ${env_data.RR_CMS_application_url}    ${env_data.browser}  options=${options}
    Set Window Size    ${env_data.window_height}    ${env_data.window_width}
#    Wait Until Page Contains Element    ${email_field}    timeout=10

Login To CMS
    Wait Until Element Is Visible    ${cms_client_id}  timeout=30
    Input Text    ${cms_client_id}    rr01
#    Input Text    ${cms_client_id}    kc_v101
    Input Text    ${cms_username}    download_data
    Input Text    ${cms_password}    Download@123
    Wait Until Element Is Visible    ${cms_login_button}
    Sleep    1
    Click Element    ${cms_login_button}

Get Otp From CMS
    [Arguments]    ${mobile_number}
    Wait Until Element Is Visible    ${showcase_icon}  timeout=30
    Click Element    ${showcase_icon}
    Wait Until Element Is Visible    ${download_data_link}
    Click Element    ${download_data_link}
    Wait Until Element Is Visible    ${select_option_dropdown}
    Click Element    ${select_option_dropdown}
    Select From List By Value    ${select_option_dropdown}  32
#    Select From List By Value    ${select_option_dropdown}  13
    Press Keys    ${select_option_dropdown}    ENTER
    Click Element    ${start_date_timepicker}
    Input Text    ${start_date_timepicker}    04/15/2024 07:03 PM
    Click Element    ${end_date_timepicker}
    Click Element    ${download_user_button}
    ${file_path}  Verify File Is Downloaded
    ${otp_data}  Fetch User Details By Number    ${file_path}    ${mobile_number}
    ${data}  Create Dictionary  &{otp_data}
    RETURN   ${data.otp}

Verify File Is Downloaded
    ${now}  Get Time  epoch
    Sleep    2
    ${res}  Check Download And Return Filepath   ${now}
    Log    ${res}
    Should Contain    ${res}    .xlsx
    File Should Exist    ${res}
    RETURN  ${res}

Open CMS Window
    ${env_data}  Get Environment Data    ${web_environment}
    ${env_data}  Create Dictionary  &{env_data}
    Execute Javascript   window.open('${env_data.RR_CMS_application_url}');

Login Into CMS And Get OTP
    [Arguments]  ${mobile_number}
    Open CMS Window
    Switch Window  NEW
    Login To CMS
    ${otp}  Get Otp From CMS    ${mobile_number}
    Switch Window  MAIN
    RETURN  ${otp}


Login To CMS And Delete User From CMS
    [Arguments]    ${mobile_number}
    Open CMS Window
    Switch Window  NEW
    Wait Until Element Is Visible    ${cms_client_id}  timeout=30
    Input Text    ${cms_client_id}    rr01
    Input Text    ${cms_username}    delete_user
    Input Text    ${cms_password}    User@12345
    Wait Until Element Is Visible    ${cms_login_button}
    Sleep    1
    Click Element    ${cms_login_button}
    Wait Until Element Is Visible    ${showcase_icon}  timeout=30
    Click Element    ${showcase_icon}
    Wait Until Element Is Visible    ${delete_data_btn}
    Click Element    ${delete_data_btn}
    Wait Until Element Is Visible    ${mobile_num_input}
    Input Text    ${mobile_num_input}    ${mobile_number}
    Click Element    ${delete_user_btn}
    Wait Until Element Is Visible    ${deleted_msg}     timeout=10s
