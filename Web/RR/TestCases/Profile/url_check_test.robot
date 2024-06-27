*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/Login/login_keywords.robot
Resource    ../../../../CommonBase/Cms/Resources/otp_keywords.robot

Test Setup      Launch Application
Test Teardown   Close Browser

##*** Test Cases ***
##Check URL Status
##    ${result}=    Check Url    https://stg-rr.sportz.io/latest-news
##    Log    ${result}
#
#*** Settings ***
#Library  SeleniumLibrary
#Resource  ../../Resources/Login/login_keywords.robot
#Resource  ../../Resources/Profile/profile_keywords.robot
#Resource  ../../../CommonKeywords/Resources/Cms/otp_keywords.robot
#
#Test Setup      Launch Application
#Test Teardown   Close Browser
#
#*** Test Cases ***
#Check URL Status
#    ${links}=    Get All Links From URL     https://stg-rr.sportz.io/latest-news
#    Log Many    ${links}
#    [Return]    ${links}
#
##*** Keywords ***
##Get All Links
##    ${links}=    Get All Links From URL     https://stg-rr.sportz.io/latest-news
##    [Return]    ${links}

#*** Settings ***
#Library    SeleniumLibrary
#Library    Collections
#
#*** Variables ***
#${URL}    https://stg-rr.sportz.io/latest-news
#
#*** Test Cases ***
#Fetch All Links From DOM
#    [Documentation]    Open the URL and fetch all links from the DOM
#    Open Browser    ${URL}    Chrome
#    ${links}=    Get All Links From Page
#    Log Many    ${links}
#    [Teardown]    Close Browser
#
#*** Keywords ***
#Get All Links From Page
#    ${elements}=    Get WebElements    xpath=//a
#    ${links}=    Create List
#    FOR    ${element}    IN    @{elements}
#        ${href}=    Get Element Attribute    ${element}    href
#        Run Keyword If    ${href}    Append To List    ${links}    ${href}
#    END
#    [Return]    ${links}
#

#*** Test Cases ***
#Fetch All Links From DOM
#    [Documentation]    Open the URL and fetch all links from the DOM
#    Open Browser    https://stg-rr.sportz.io/latest-news    Chrome
#    ${links}=    Get All Links From Page
#    Log Many    ${links}
#    [Teardown]    Close Browser
#
#*** Keywords ***
#Get All Links From Page
#    ${elements}=    Get WebElements    xpath=//a
#    ${links}=    Create List
#    FOR    ${element}    IN    @{elements}
#        ${href}=    Get Element Attribute    ${element}    href
#        Run Keyword If    ${href}    Append To List    ${links}    ${href}
#    END
#    [Return]    ${links}

*** Variables ***
${URL}    https://stg-rr.sportz.io/latest-news

*** Test Cases ***
Fetch All Links From DOM
    [Documentation]    Open the URL and fetch all links from the DOM
    ${result}=    Check Url    ${URL}
    ${alllinkcounts}=    Get Element Count    xpath://a
    Log   ${alllinkcounts}
    @{links}=    Create List
    FOR    ${counter}    IN RANGE     1    ${alllinkcounts}+1
        ${link}     Get Text    xpath:(//a)[${counter}]
        Log    ${link}
    END


