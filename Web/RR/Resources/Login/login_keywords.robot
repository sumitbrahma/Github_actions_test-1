*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Library    BuiltIn
Library    ../../../../CommonBase/Utilities/user_keywords.py
Variables  ../../../../Downloads/Downloads.py
Variables  ../../PageObjects/Login/login_page_locators.py
Resource    ../Fixtures and Results/fixturesresults_keywords.robot

*** Variables ***
${web_environment}  ${CURDIR}${/}..${/}..${/}..${/}..${/}Runners${/}Environment${/}web_environment.json
${VALID_EMAIL_REGEX}    ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$

*** Keywords ***
open application and launch the URL
    ${options} =  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    ${options_firefox} =    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    ${prefs}  Create Dictionary  download.default_directory=${default_download_path}
    Call Method  ${options}  add_experimental_option  prefs  ${prefs}
    Open Browser    https://stg-rr.sportz.io/    chrome
    Open Browser    https://stg-rr.sportz.io/    firefox

Launch Application
    ${env_data}  Get Environment Data    ${web_environment}
    ${env_data}  Create Dictionary  &{env_data}
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys
    Call Method  ${options}  add_argument  --disable-notifications
    Call Method  ${options}  add_argument  --disable-infobars
    Call Method  ${options}  add_argument  --disable-extensions
    Call Method  ${options}  add_argument  --no-sandbox
    Call Method  ${options}  add_argument  --headless
    Call Method  ${options}  add_argument  --disable-dev-shm-usage
    ${prefs}  Create Dictionary  download.default_directory=${default_download_path}
    Call Method  ${options}  add_experimental_option  prefs  ${prefs}
#    Call Method  ${options}  add_argument  headless
    Open Browser     ${env_data.RR_application_url}    ${env_data.browser}  options=${options}
    Set Window Size    ${env_data.window_height}    ${env_data.window_width}
#    Open Browser  ${env_data.RR_application_url}  ${env_data.browser}
    Maximize Browser Window

Click On Login Button
    Wait Until Page Contains Element    ${login_button}  timeout=30
    Click Element    ${login_button}

Enter Mobile Number
    [Arguments]     ${value}
    Wait Until Element Is Visible    ${mobile_number_field_1}  timeout=30
    Input Text    ${mobile_number_field_1}    ${value}

Click on No Button
    Wait Until Element Is Visible   ${whatsapp_no_button}  timeout=30
    Click Element    ${whatsapp_no_button}

Verify if new user clicks on yes button
    Wait Until Element Is Visible    ${whatsapp_yes_button}     timeout=30
    Click Element    ${whatsapp_yes_button}

Click On Send SMS Button
    Wait Until Element Is Visible    ${send_sms_button}  timeout=30
    Click Element    ${send_sms_button}

Enter OTP
    [Arguments]  ${otp}
    Wait Until Element Is Visible    ${otp_input}   timeout=30
    ${otp}  Convert To String    ${otp}
    ${otp_elements}  Get WebElements    ${otp_input}
    ${index}  Set Variable  0
    FOR    ${element}    IN    @{otp_elements}
        Input Text    ${element}    ${otp}[${index}]
        ${index}  Evaluate    ${index}+1
    END

Verify OTP less sign in pop-up should get displayed to user
    Wait Until Element Is Visible    ${send_sms_button}    timeout=30
    Wait Until Page Contains Element    ${send_sms_button}   timeout=30

Click On Yes Button
        Wait Until Element Is Visible    ${whatsapp_yes_button}    timeout=30
        Click Element    ${whatsapp_yes_button}

Click on whatsapp icon
    Sleep    5
    Wait Until Element Is Visible    ${otp_less_iframe}     timeout=30
    Select Frame    ${otp_less_iframe}
    Set Focus To Element    ${whatsapp_icon_frame}
    Wait Until Element Is Visible    ${whatsapp_icon}
    Click Element    ${whatsapp_icon}

Verify User should able to view barcode to scan
    Wait Until Page Contains Element    ${whatsapp_barcode}   timeout=30
    Page Should Contain Element    ${whatsapp_barcode}

Verify Email Id field
    [Arguments]  ${email}
    Wait Until Element Is Visible    ${email_id_field}
    Input Text    ${email_id_field}    ${email}

User Is Able To Fill Pin Code
    Wait Until Element Is Enabled    ${pincode_field}   timeout=20
    Press Keys    ${pincode_field}    400078

Validate Mobile Number Field
    [Arguments]     ${value}
    Wait Until Element Is Visible    ${mobile_number_field_1}  timeout=30
    Input Text      ${mobile_number_field}    ${value}
    ${input_value}=    Get Value    ${mobile_number_field_1}
    Should Match Regexp    ${input_value}    ^[0-9]{10}$

Mobile No Field Should not be blank
    [Arguments]  ${locator}
    ${mobile_number}  Get Value  ${locator}
    Should Not Be Empty  ${mobile_number}

Verify Error Message on Blank Login Field
    Press Keys      ${mobile_number_field_1}    BACKSPACE
    Click on No Button
    Page Should Contain Element    ${error_message}
    Should Contain    ${error_message}  Invalid

Verify Mobile Number Field
    Wait Until Element Is Visible    ${mobile_number_field_1}  timeout=30
    Wait Until Page Contains Element    ${mobile_number_field_1}    timeout=10

Validate Mobile Number
    [Arguments]    ${mobile_number}    ${country_code}
    ${is_valid}    Validate Mobile Number    ${mobile_number}    country_code=${country_code}
    [Return]    ${is_valid}

Send OTP Via SMS Button Should Get Displayed To User
    Page Should Contain Element    ${send_otp_button}   timeout=30

Verify System Should Accept The OTP
    Wait Until Element Is Enabled    ${first_name_field}   timeout=20s
    Page Should Contain Element    ${first_name_field}

Verify Failed Message Should Visible To User
    Wait Until Element Is Enabled    ${failed_message}  timeout=10
    Page Should Contain Element    ${failed_message}

Verify User should Able To View Six Boxes To Enter Six Digit Received OTP
    Wait Until Element Is Visible    ${otp_input}   timeout=30
    ${otp_elements}  Get WebElements    ${otp_input}
    ${otp_elements_length}=    Get Length    ${otp_elements}
     FOR    ${index}    IN RANGE    0    5
        ${element}=    Collections.Get From List    ${otp_elements}    ${index}
        Wait Until Page Contains Element    ${element}    timeout=10
     END

Enter Wrong OTP
    Enter OTP   123456

Validate Mobile Number According To Country Code
    [Arguments]  ${mobile_number}  ${country_code}
    ${pattern}  Set Variable  ${EMPTY}
    ${valid}  Run Keyword And Return Status  Should Match Regexp  ${mobile_number}  ${pattern}
    Run Keyword If  not ${valid}  Fail  Mobile number '${mobile_number}' is not valid for country code '${country_code}'

User Should Able To View Error Message Of Email Already In Use
    Sleep    5
    Wait Until Element Is Visible    ${submit_button}  20s
    Click Element    ${submit_button}
    Scroll Element Into View   ${emailid_error_message}
    Page Should Contain Element    ${emailid_error_message}


Able To View Maharastra As State And Mumbai As City
    Click Element    ${city_loc}
    Set Focus To Element    ${city_loc}
    ${city}     Get Value   ${city_loc}
    Should Be Equal   ${city}   Mumbai
    Click Element   ${state_loc}
    ${state}    Get Value   ${state_loc}
    Should Be Equal  ${state}   MAHARASHTRA

Create Dynamic Xpath
    [Arguments]     ${xpath}    ${value}    ${replace_with_value}
    Replace String    ${xpath}    ${value}    ${replace_with_value}

Validate Email Address
    [Arguments]    ${email}
    Should Match Regexp    ${email}    ${VALID_EMAIL_REGEX}









