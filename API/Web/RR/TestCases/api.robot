*** Settings ***
Library    RequestsLibrary
Library  OperatingSystem
Library    String
Library    Collections
Library    SeleniumLibrary
Resource  ../../CommonKeywords/Resources/Cms/otp_keywords.robot

*** Variables ***
${base_url}  https://stg-rr.sportz.io
${get_profile_url}  https://stg-rr.sportz.io/apiv3/auth/getprofile?

${mobile_number}  8000000058

${data_1}  { "data": { "mobile_no": "${mobile_number}", "email_id": "", "captcha": "", "type": 1, "opt": 1, "country_code": "+91", "is_app": "1" } }
${expected_response_1}  {"status":200,"ApplicationDomain":null,"data":{"status":"1","message":"Success","otp_duration":"120"},"content":null,"ImagesData":null,"Authodata":null,"NextPrev":null,"EntityData":null,"RelatedArticle":null,"message":null,"response_status":null,"fetchfromcache":false,"asycncall":false,"time":null,"meta":null}

${data_2}  { "data": { "mobile_no": "${mobile_number}", "otp": "replace_otp", "captcha": "", "is_app": "1", "platform_version": 1, "platform_type": "1", "device_name": "web" } }
${expected_response_2}  {"status":200,"ApplicationDomain":null,"data":{"status":"1","message":"Success","otp_duration":"120"},"content":null,"ImagesData":null,"Authodata":null,"NextPrev":null,"EntityData":null,"RelatedArticle":null,"message":null,"response_status":null,"fetchfromcache":false,"asycncall":false,"time":null,"meta": null}

${data_3}  { "data": { "mobile_no": "${mobile_number}", "email_id": "", "otp":"replace_otp", "type": 1, "country_code": "+91", "is_app":"1", "captcha": "" } }
${expected_response_3}  {"status":200,"ApplicationDomain":null,"data":{"status":"1","message":"Success"},"content":null,"ImagesData":null,"Authodata":null,"NextPrev":null,"EntityData":null,"RelatedArticle":null,"message":null,"response_status":null,"fetchfromcache":false,"asycncall":false,"time":null,"meta":null}
${data_4}  {data{ status: 2}}
${expected_response_4}     { "status": 200,"ApplicationDomain": null,"data": {"user_guid": "2fdb3cb3-8bbe-4b7c-a86b-f3f4c7ee50aa-10042024073911034","user_id": "1477806","email_id": "adi15jan@gmail.com","status": "1","message": "Success", "subject": null}}
${update_profile_data}     {"data": {"email_id": "TEST@6cibsz.cashbenties.com", "otp": "captcha": "","is_app": "","platform_version": "","platform_type": 3,"device_name": "","user": {"mobile_no":"9000000023","pincode": "","dob": "2008-11-21","gender": "male","country_id": "","country_name": "","country_code": "91","city": "","favourite_player_id": "","favourite_player_name": "","jersey_number": 13,"jersey_name": "","first_name": "aj","last_name": "sk", "membership_code": "","Internal_referral_code": "","subscribe_for_email": true,"accept_tnc": true,"accept_disclaimer": true},"imagejson": {"imageName": "","imageUrl": "","imageJson": "","userguid": "","is_app": "","userid": ""}}}
${expected_response_5}    {"status": 200,"ApplicationDomain": null,"data": {"user_guid": "cf189d3e-e2a8-4271-931c-ba92ee7a210f-08052024085012447","user_id":"2410225","email_id":"TEST@66cibsz.cashbenties.com","status": "1","message": "Profile updated successfully.","subject": null,"user": {"name": "","edition": "","favourite_club": "","favourite_team": null,"favourite_team_logo": null,"social_user_image": "","mobile_no": "9000000023","profile_completion_percentage": null,"first_name": "aj","last_name": "sk","pug_first_name": null,"pug_last_name": null,"profile_page_enabled": null,"campaign_id": "","address": "","pincode": "","campaign_json": null,"membership_related_json": null,"ext_info": null,"membership_code": "","gender": "male","city": "","social_user_name": "","country_id": "","country_code": "91","state_name": "","country_name": "","city_id": "","state_id": "","subscribe_for_email": true,"previous_subscription_key": false,"dob": "2008-11-21","sportsbet_username": null,"jersey_number": 13,"jersey_name": "","favourite_player_id": "","favourite_player_name": "","subscribe_for_watsapp": false,"accept_tnc": false,"internal_referral_code": "","referal_user_guid": null, "is_referred": null,"accept_disclaimer": false,"asc_with_hockey": null,"age_group": null},"created_date": "2024-05-08 08:42:16.078124","updated_date": "2024-05-08 08:50:12.349983","is_first_login": "0","is_custom_image": "0","client_id": null,"waf_user_guid": "4a3786ff-f3da-44fa-a9cb-ef3de7e717d3","user_data_store_type": null,"last_recover_date": null,"email_verified": "0","mobile_verified": "0","pass_type": null,"password": null,"cc": null,"bcc": null,"addtional_info": {"push_flag": false,"install_id": "","push_token": "","sync_status": 1,"web_subs_id": "","web_attributes": null,"device_attributes": null,"service_type_status": "2","is_app": "1"}, "platform_type": 0,"token": "6eb9c703-1dd5-44a8-b206-9ce1c2c34bec","epoch_timestamp": "1715158212","is_first_registered": null,"loggedin_device_info": null,"t": 525600},"content": null,"ImagesData": null,"Authodata": null,"NextPrev": null,"EntityData": null,"RelatedArticle": null,"message": null,"response_status": null,"fetchfromcache": false,"asycncall": false,"time": null,"meta": null}
${delete_user}    {"data": {"is_app": "1","captcha": "","platform_version": 1,"platform_type": "1","device_name": "web"}}
${delete_user_expected}     {"status":200,"ApplicationDomain":null,"data":{"status":"1","message":"Account deletion instructions has been sent to your registered email.","attempts":null},"content":null,"ImagesData":null,"Authodata":null,"NextPrev":null,"EntityData":null,"RelatedArticle":null,"message":null,"response_status":null,"fetchfromcache":false,"asycncall":false,"time":null,"meta":null}
${sendrecoveryemaildata}  {"data" : {"is_app": "1", "captcha":"","platform_version": 1,"platform_type": "1","device_name": "web"}}
${sendrecoveryemailexpected}  {"status":200,"ApplicationDomain":null,"data": {"status":"0","message":"Unknown user","attempts":null},"content":null,"ImagesData":null,"Authodata":null,"NextPrev":null,"EntityData":null,"RelatedArticle":null,"message":null,"response_status":null,"fetchfromcache":false,"asycncall":false,"time":null,"meta":null}
${recover_link_data}        {"data":{"is_app":"1","verification_key":"5971387244627431544F7561304C457159656444517530627A755863634B4A67573845486B6C306E4B58434F2B59776C3473445653665A745A4638587A703576","platform_version":1,"platform_type": "1","device_name": "web"}}
${recover_link_expected}    {"status": 400,"ApplicationDomain": null,"data": {"user_guid": null,"user_id": null,"email_id": null,"status": null,"message": null,"subject": null,"user": null,"created_date": null,"updated_date": null,"is_first_login": null,"is_custom_image": null,"client_id": null,"waf_user_guid": null,"user_data_store_type": null,"last_recover_date": null,"email_verified": null,"mobile_verified": null,"pass_type": null,"password": null,"cc": null,"bcc": null,"addtional_info": null,"platform_type": 0,"token": null,"epoch_timestamp": null,"is_first_registered": null,"loggedin_device_info": null,"t": 0},"content": null,"ImagesData": null,"Authodata": null,"NextPrev": null,"EntityData": null,"RelatedArticle": null,"message": null,"response_status": null,"fetchfromcache": false,"asycncall": false,"time":null,"meta":null}
${delete_user_account}    {"data": {"is_app": "1","captcha": "","platform_version": 1,"platform_type": "1","device_name": "web"}
${delete_user_account_expected}     {"status":400,"ApplicationDomain":null,"data":{"status": "0","message":"Invalid Image !","attempts": null},"content": null,"ImagesData": null,"Authodata": null,"NextPrev": null,"EntityData": null,"RelatedArticle": null,"message": null,"response_status": null,"fetchfromcache": false,"asycncall": false,"time": null,"meta": null}

*** Test Cases ***
TC1 Post Api Send OTP
    [Tags]      SendOTP
    [Documentation]     Verify Post Method send otp
    Create Session    mysession    ${base_url}
    ${header}=      Create Dictionary   auth=q4F6aFKgfg123  Content-Type=application/json
    ${params} =    Create Dictionary    is_serverside=1    is_app=1
    ${response}=    POST On Session    mysession    apiv3/auth/sendotp  params=${params}  data=${data_1}  headers=${header}
    ${code}=    Convert To String    ${response.status_code}
    Should Be Equal     ${code}    200
    ${res}  Convert To String  ${response.content}
    Should Be Equal    ${res}    ${expected_response_1}

TC2 Post Api Signup With OTP2
    [Tags]      signin
    [Documentation]     Verify Post Method to signup with otp
    Open CMS for RRis_app
    Login To CMS
    ${otp}  Get Otp From CMS   ${mobile_number}
    ${otp}  Convert To String    ${otp}
    Set Global Variable    ${otp}
    Close Browser
    Create Session    mysession    ${base_url}
    ${data_with_otp}  Replace String  ${data_2}  replace_otp  ${otp}
    ${header}=      Create Dictionary   auth=q4F6aFKgfg123  Content-Type=application/json
    ${params} =    Create Dictionary    is_serverside=1    =1
    ${response}=    POST On Session    mysession    apiv3/auth/signinwithotp  params=${params}  data=${data_with_otp}  headers=${header}
    ${code}=    Convert To String    ${response.status_code}
    Should Be Equal     ${code}    200
    &{res_data}  Set Variable  ${response.json()}
    ${user_guid}  Set Variable  ${res_data.data.user_guid}
    Set Global Variable  ${user_guid}

TC3 Verify Otp Api
    [Tags]      Verify Otp
    [Documentation]     Verify Post Method to verify otp
    Create Session    mysession    ${base_url}
    ${data_with_otp}  Replace String  ${data_3}  replace_otp  ${otp}
    ${header}=      Create Dictionary   auth=q4F6aFKgfg123  Content-Type=application/json
    ${params} =    Create Dictionary    is_serverside=1    is_app=1
    ${response}=    Post Request    mysession    apiv3/auth/verifyotp  params=${params}   data=${data_with_otp}  headers=${header}
    ${code}=    Convert To String    ${response.status_code}
    Should Be Equal     ${code}    200
    ${res}  Convert To String  ${response.content}
    Should Be Equal    ${res}    ${expected_response_3}

Validate GET Profile
    [Tags]    Profile
    [Documentation]   Verify Get Profile
    Create Session    mysession    ${base_url}
    ${header}=      Create Dictionary   auth=q4F6aFKgfg123  Content-Type=application/json  usertoken=NisydzlMSldCSEdpZnJsdStLT01NZzZuNjV5ZEVRWHJETFp3ajJSaFRYMWh4a1E2SEI4RlgrZWZtQ3hPanp0ZFNkanpFT3ZnVEVSSEhOb3JaQi9RKzVqdC9XUVlKM0tQQURMdUZZQUlHdXV2aTJ4NWtyWFMxWXZBVmd3QXNCNm9FamtUVkdOdDNuMVRYRm90QUJmUCs5SDYxMjV0dC9Wb25UQUpxOGtFLzhmT2ZDWGdxYVM5REw5R3hEU21rRVZjVFNzc0hkSkZ4aHYzR21VVTZMaTlHOG9NY1RZaWF0YStDZXZ1STdFb0FjRGFQRGV1SzN2RjlVVzB2ZFF5L2IwaHJ0NG43YnpRemJNL1F6KzJocjV6VmVrRzJ2ekdzUmQwQ3Q1cllYZ3RyMGVLR3FTZjBpZWFVZkJqSmZSNFRJOEtkL3ZVQ2NzV1pYQkhIZGZrRnRiWjZxVjV2Vm91TXh1czF5bHpsOTEycFJNPQ==
    ${params} =    Create Dictionary   token=c62bc317-622f-4903-8cd1-6136c460af86-08052024084216277  is_app=1
    ${response}=   Get Request   mysession   apiv3/auth/getprofile   params=${params}  headers=${header}
    Should Be Equal As Strings    ${response.status_code}    200
    &{res_data}  Set Variable  ${response.json()}
    #${status_value}  Set Variable  ${res_data.data.status}
    Should Be Equal   ${res_data.data.status}      2
    Should Be Equal    ${res_data.data.message}    Incomplete Profile

Verify Update Profile
    [Tags]    Profile
    [Documentation]    Update Profile
    Create Session    mysession     ${base_url}
    ${header} =  Create Dictionary  auth=q4F6aFKgfg123  Content-Type=application/json  usertoken=NisydzlMSldCSEdpZnJsdStLT01NZzZuNjV5ZEVRWHJETFp3ajJSaFRYMWh4a1E2SEI4RlgrZWZtQ3hPanp0ZFNkanpFT3ZnVEVSSEhOb3JaQi9RKzVqdC9XUVlKM0tQQURMdUZZQUlHdXV2aTJ4NWtyWFMxWXZBVmd3QXNCNm9FamtUVkdOdDNuMVRYRm90QUJmUCs5SDYxMjV0dC9Wb25UQUpxOGtFLzhmT2ZDWGdxYVM5REw5R3hEU21rRVZjVFNzc0hkSkZ4aHYzR21VVTZMaTlHOG9NY1RZaWF0YStDZXZ1STdFb0FjRGFQRGV1SzN2RjlVVzB2ZFF5L2IwaHJ0NG43YnpRemJNL1F6KzJocjV6VmVrRzJ2ekdzUmQwQ3Q1cllYZ3RyMGVLR3FTZjBpZWFVZkJqSmZSNFRJOEtkL3ZVQ2NzV1pYQkhIZGZrRnRiWjZxVjV2Vm91TXh1czF5bHpsOTEycFJNPQ==
    ${params} =  Create Dictionary    is_serverside=1    is_app=1
    ${response}=    Post Request    mysession    apiv3/auth/updateProfile  params=${params}   data= ${update_profile_data}   headers=${header}
    ${code}=    Convert To String    ${response.status_code}
    Should Be Equal     ${code}    200
    ${res}  Convert To String  ${response.content}
    Should Be Equal    ${res}    ${expected_response_5}


Verify Delete User
    [Tags]    Delete User
    [Documentation]    Delete User
    Create Session    mysession     ${base_url}
    ${header} =  Create Dictionary  auth=q4F6aFKgfg123  Content-Type=application/json  usertoken=NisydzlMSldCSEdpZnJsdStLT01NZzZuNjV5ZEVRWHJETFp3ajJSaFRYMWh4a1E2SEI4RlgrZWZtQ3hPanp0ZFNkanpFT3ZnVEVSSEhOb3JaQi9RKzVqdC9XUVlKM0tQQURMdUZZQUlHdXV2aTJ4NWtyWFMxWXZBVmd3QXNCNm9FamtUVkdOdDNuMVRYRm90QUJmUCs5SDYxMjV0dC9Wb25UQUpxOGtFLzhmT2ZDWGdxYVM5REw5R3hEU21rRVZjVFNzc0hkSkZ4aHYzR21VVTZMaTlHOG9NY1RZaWF0YStDZXZ1STdFb0FjRGFQRGV1SzN2RjlVVzB2ZFF5L2IwaHJ0NG43YnpRemJNL1F6KzJocjV6VmVrRzJ2ekdzUmQwQ3Q1cllYZ3RyMGVLR3FTZjBpZWFVZkJqSmZSNFRJOEtkL3ZVQ2NzV1pYQkhIZGZrRnRiWjZxVjV2Vm91TXh1czF5bHpsOTEycFJNPQ==
    ${params} =  Create Dictionary   is_app=1
    ${response}=    Post Request    mysession    apiv3/auth/deleteuseraccount  params=${params}   data= ${delete_user}   headers=${header}
    ${code}=    Convert To String    ${response.status_code}
    Should Be Equal     ${code}    200
    ${res}  Convert To String  ${response.content}
    Should Be Equal    ${res}    ${delete_user_expected}

Send Recover Email
    [Tags]    Email
    [Documentation]    Recover Email
    Create Session    mysession     ${base_url}
    ${header} =  Create Dictionary  auth=q4F6aFKgfg123  Content-Type=application/json  usertoken=NisydzlMSldCSEdpZnJsdStLT01NZzZuNjV5ZEVRWHJETFp3ajJSaFRYMWh4a1E2SEI4RlgrZWZtQ3hPanp0ZFNkanpFT3ZnVEVSSEhOb3JaQi9RKzVqdC9XUVlKM0tQQURMdUZZQUlHdXV2aTJ4NWtyWFMxWXZBVmd3QXNCNm9FamtUVkdOdDNuMVRYRm90QUJmUCs5SDYxMjV0dC9Wb25UQUpxOGtFLzhmT2ZDWGdxYVM5REw5R3hEU21rRVZjVFNzc0hkSkZ4aHYzR21VVTZMaTlHOG9NY1RZaWF0YStDZXZ1STdFb0FjRGFQRGV1SzN2RjlVVzB2ZFF5L2IwaHJ0NG43YnpRemJNL1F6KzJocjV6VmVrRzJ2ekdzUmQwQ3Q1cllYZ3RyMGVLR3FTZjBpZWFVZkJqSmZSNFRJOEtkL3ZVQ2NzV1pYQkhIZGZrRnRiWjZxVjV2Vm91TXh1czF5bHpsOTEycFJNPQ==
    ${params} =  Create Dictionary   is_app=1
    ${response} =    Post Request    mysession    /apiv3/auth/recoveruseraccount  params=${params}   data= ${recover_link_data}   headers=${header}
    ${code}=    Convert To String    ${response.status_code}
    Should Be Equal     ${code}    200
    ${res}  Convert To String  ${response.content}
    Should Be Equal    ${res}        ${recover_link_expected}

Delete User Account
    [Tags]    Email
    [Documentation]    Recover Email
    Create Session    mysession     ${base_url}
    ${header} =  Create Dictionary  auth=q4F6aFKgfg123  Content-Type=application/json  usertoken=NisydzlMSldCSEdpZnJsdStLT01NZzZuNjV5ZEVRWHJETFp3ajJSaFRYMWh4a1E2SEI4RlgrZWZtQ3hPanp0ZFNkanpFT3ZnVEVSSEhOb3JaQi9RKzVqdC9XUVlKM0tQQURMdUZZQUlHdXV2aTJ4NWtyWFMxWXZBVmd3QXNCNm9FamtUVkdOdDNuMVRYRm90QUJmUCs5SDYxMjV0dC9Wb25UQUpxOGtFLzhmT2ZDWGdxYVM5REw5R3hEU21rRVZjVFNzc0hkSkZ4aHYzR21VVTZMaTlHOG9NY1RZaWF0YStDZXZ1STdFb0FjRGFQRGV1SzN2RjlVVzB2ZFF5L2IwaHJ0NG43YnpRemJNL1F6KzJocjV6VmVrRzJ2ekdzUmQwQ3Q1cllYZ3RyMGVLR3FTZjBpZWFVZkJqSmZSNFRJOEtkL3ZVQ2NzV1pYQkhIZGZrRnRiWjZxVjV2Vm91TXh1czF5bHpsOTEycFJNPQ==
    ${params} =  Create Dictionary   is_app=1
    ${response} =    Post Request    mysession    apiv3/auth/deleteuseraccount   params=${params}   data= ${delete_user_account}   headers=${header}
    ${code}=    Convert To String    ${response.status_code}
    Should Be Equal     ${code}    400
    ${res}  Convert To String   ${response.content}
    Should Be Equal    ${res}        ${delete_user_account_expected}
