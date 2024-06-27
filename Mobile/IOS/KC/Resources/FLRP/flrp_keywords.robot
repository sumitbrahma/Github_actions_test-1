*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    ../../../../../CommonBase/Utilities/user_keywords.py
Variables   ../../PageObjects/Login/login_locators.py
Variables   ../../PageObjects/HomeScreen/home_screen_locators.py
Variables   ../../PageObjects/AccessibilityID/accessibility_id.py
Variables   ../../PageObjects/FLRP/flrp_locators.py


*** Keywords ***
Get Tokens Earned
    wait until page contains element    ${user_icon}    timeout=30
    click element    ${user_icon}
    wait until page contains element    ${tokens_left_text}
    ${tokens}    get element attribute    ${tokens_left_text}    value
    RETURN    ${tokens}

Get Tokens Left
    wait until page contains element    ${user_icon}    timeout=30
    click element    ${user_icon}
    wait until page contains element    ${tokens_left}    timeout=30
    ${tokens}    get text    ${tokens_left}
    RETURN    ${tokens}

Go To News Article Page
    wait until page contains element    ${menu_button}    timeout=30
    click element    ${menu_button}
    wait until page contains element    ${news_menu}    timeout=30
    click element    ${news_menu}
    wait until page contains element    ${news_first_article}    timeout=30

Click On First News Article
    wait until page contains element    //XCUIElementTypeStaticText[@name="News"]/preceding-sibling::XCUIElementTypeStaticText[2]    timeout=30
    ${news_title}    get element attribute    //XCUIElementTypeStaticText[@name="News"]/preceding-sibling::XCUIElementTypeStaticText[2]    value
    click element    //XCUIElementTypeStaticText[@name="News"]/preceding-sibling::XCUIElementTypeStaticText[2]
    wait until page contains element    //XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeStaticText     timeout=30
    ${news_title_2}    get element attribute    //XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeStaticText    value
    should be equal    ${news_title}    ${news_title_2}

Swipe Up Until Element Is Visible
    [Arguments]    ${element}
    FOR  ${count}  IN RANGE    0    10
        ${status}    run keyword and return status    wait until element is visible   ${element}
        IF    ${status}
            exit for loop
        END
        Swipe    ${191}    ${665}    ${194}    ${277}
    END

Swipe down Until Element Is Visible
    [Arguments]    ${element}
    FOR  ${count}  IN RANGE    0    10
        ${status}    run keyword and return status    wait until element is visible   ${element}
        IF    ${status}
            exit for loop
        END
        Swipe    ${191}    ${185}    ${186}    ${716}
    END

Click Button On In App Notifications
    wait until page contains element    ${news_detail_text}    timeout=10
    click element    ${news_detail_text}

Click On Back Button
    wait until page contains element    accessibility_id=${back_icon_id}
    click element    accessibility_id=${back_icon_id}

Click On Home Button
  wait until page contains element    ${home_button}
  click element    ${home_button}

Verify Tokens Are Created
  [Arguments]     ${tokens_before}    ${new_token}
  ${tokens}    evaluate    ${tokens_before}+${new_token}
  ${tokens_2}    Get Tokens Earned
  should be equal as numbers    ${tokens}    ${tokens_2}

Redeem Coupen
    [Arguments]    ${token}
    Click Element     ${redeem_your_token_button}
    wait until page contains element    accessibility_id=${checkbox_unselected_id}
    Click Element     accessibility_id=${checkbox_unselected_id}
    swipe up until element is visible    //XCUIElementTypeStaticText[@name="${token}"]/following-sibling::XCUIElementTypeButton[@name="REDEEM"]
    Click Element     //XCUIElementTypeStaticText[@name="${token}"]/following-sibling::XCUIElementTypeButton[@name="REDEEM"]

Verify The Alert Message Of Insufficient Balance
    wait until page contains element    ${insufficient_balance_message}

Verify Redeemed | Coming Soon Coupens Are Prohibited
    [Arguments]    ${type}
    Click Element     ${redeem_your_token_button}
    wait until page contains element    accessibility_id=${checkbox_unselected_id}
    Click Element     accessibility_id=${checkbox_unselected_id}
    Swipe Up Until Element Is Visible    xpath=//XCUIElementTypeStaticText[@name="${type}"][1]
    click element    xpath=//XCUIElementTypeStaticText[@name="${type}"][1]
    sleep    3
    page should not contain element    ${you_have_redeemed_coins_message}


Verify Checkbox Must Be checked Before Redeeming Coupen
    Click Element     ${redeem_your_token_button}
    swipe up until element is visible    ${first_redeem_button}
    click element    ${first_redeem_button}
    wait until page contains element    ${terms_condition_warning}
    wait until page contains element    accessibility_id=${checkbox_unselected_id}
    Click Element     accessibility_id=${checkbox_unselected_id}
    click element    ${first_redeem_button}
    wait until page contains element    ${you_have_redeemed_coins_message}

Verify Coupen Redeem Alert
    wait until page contains element    ${you_have_redeemed_coins_message}

Verify Tokens Are Deducted From Account
    [Arguments]    ${tokens_before_redeem}    ${coupen_value}
    wait until page contains element    ${tokens_left}
    ${tokens_after_redeem}    get element attribute    ${tokens_left}    value
    ${expected_tokens_left}    evaluate    ${tokens_before_redeem}-${coupen_value}
    should be equal as numbers    ${tokens_after_redeem}    ${expected_tokens_left}

Verify User Gets Coupen Code After Redeem
    ${coupen_code}    get text    ${coupen_code_text}
    should not be empty    ${coupen_code}

Open Any Podcast of Knight TV
    Swipe Up Until Element Is Visible    ${knight_tv_text}
    click element    ${knight_tv_text}
    wait until page contains element    ${flrp_like_icon}    timeout=30

Click On Like Icon
    wait until page contains element    ${flrp_like_icon}    timeout=30
    click element    ${flrp_like_icon}
