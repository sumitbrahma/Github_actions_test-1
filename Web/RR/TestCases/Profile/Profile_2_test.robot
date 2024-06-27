*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Login/login_keywords.robot
Resource  ../../Resources/Profile/profile_keywords.robot
Resource  ../../../../CommonBase/Cms/Resources/otp_keywords.robot
Resource  ../../Resources/Membership/membership_keywords.robot
Library    ../../../../CommonBase/Utilities/user_keywords.py

Test Setup  open application and launch the URL
Test Teardown  Close Browser

*** Variables ***
#${data.mobile_number}=  8411048521
#${data.mobile_number}=  8421209543
#${mobile_number_3}=  8421208543
#${data.email}=  jains137301@gmail.com
#${data.email}=  jains130347@gmail.com
#${data.email}=  ja6ins142347@gmail.com
#${invalidEmail}=  jainjain2100gmail.com
#${uniqueemail}=     aditya44@mailinator.com
${testdata}    ${CURDIR}${/}..${/}..${/}TestData${/}ProfileTestcases_testdata.xlsx


*** Test Cases ***
Tc03 Verify the fields on incomplete profile
    &{data}    fetch data by id    ${testdata}    1
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Verify all fields on incomplete profile

Tc04 Verify Already Used Email Id
    &{data}    fetch data by id    ${testdata}    2
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration  ${data.email_id}
    Click On Particular Element    ${submit_button}
#    Verify Email Id field       ${data.invalidEmail}
    User Should Able To View Error Message Of Email Already In Use
    Login To CMS And Delete User From CMS   ${data.mobile_number}

Tc05 Verify If User Enter Unique And Corrcet Format Email Id Click On Login Button
    &{data}    fetch data by id    ${testdata}      3
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration       ${data.email_id}
    Verify Valid And Unique Email   ${data.email_id}

Tc06 Verify pin code field
    &{data}    fetch data by id    ${testdata}    4
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration  ${data.email_id}
    User Is Able To Fill Pin Code
    Able To View Maharastra As State And Mumbai As City

Tc07 Verify If User Enter Pincode
    #REPEATED Verify if user enter pincode TCO6
    &{data}    fetch data by id    ${testdata}    5
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration  ${data.email_id}
#    User Is Able To Fill Pin Code
    Able To View Maharastra As State And Mumbai As City

Tc08 Verify submit button functionality once all the mandatory fields get filled
    &{data}    fetch data by id    ${testdata}    6
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration  ${data.email_id}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Login To CMS And Delete User From CMS   ${data.mobile_number}

Tc09 Verify User Is Able To Skip Membership Screen
    &{data}    fetch data by id    ${testdata}    7
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration  ${data.email_id}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    Login To CMS And Delete User From CMS   ${data.mobile_number}

Tc010 Verify If User Fills All Mandatory Fields And Click On Purchase Membership Button
    #REPEATED   "Verify if user selectes pro plan and fill the
                    #required detail"     TC017
    &{data}    fetch data by id    ${testdata}      8
    Click On Login Button
    Enter Mobile Number     ${data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration  ${data.email_id}
    Click And Verify Submit Button
    Verify Membership Plan In Card Format
    Select Pro Membership Plan
    Enter Required Details For Membership
    Verify If User Selectes Pro Plan And Fill The Required Detail
    Verify User Should Redirect To Payment Gateway Screen
    Login To CMS And Delete User From CMS   ${data.mobile_number}