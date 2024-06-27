*** Settings ***
Library  AppiumLibrary
Resource  ../../Resources/Login/login_keywords.robot
Resource  ../../Resources/Notification/notification_keywords.robot

Test Setup    Open KC application
Test Teardown  Close Application

*** Variables ***
${mobile_number}  9131280079

*** Test Cases ***
#Push notifications
Verify user clicks on notification redirects to News Detail
    Open Notification Panel
#    ${notification_data}  Get Notification Details
    Collapse Notification
    Click On Push Notification    ${news_notification_title}
    Verify Push Notification Redirects To Required Page    ${news_title_big}

Verify user clicks on notification redirects to Photos Detail
    Open Notification Panel
#    ${notification_data}  Get Notification Details
    Collapse Notification
    Click On Push Notification    ${photos_notification_title}
    Verify Push Notification Redirects To Required Page    ${photo_title_big}

Verify user clicks on notification redirects to Video Detail
    Open Notification Panel
#    ${notification_data}  Get Notification Details
    Collapse Notification
    Click On Push Notification    ${video_notification_title}
    Verify Push Notification Redirects To Required Page    ${video_title_big}

Verify user clicks on notification redirects to Matchcenter Detail
    Open Notification Panel
#    ${notification_data}  Get Notification Details
    Collapse Notification
    Click On Push Notification    ${matchcenter_notification_title}
    Verify Push Notification Redirects To Required Page    ${matchcenter_vs}

#in app notifications
Verify user clicks on in-app notification redirects to News Detail
    Click On In App Notification  ${in_app_news_button}
    Verify In App Notification Redirects To Required Page  ${news_title_big}

Verify user clicks on in-app notification redirects to Matchcenter Detail
    Click On In App Notification  ${in_app_matchcenter_button}
    Verify In App Notification Redirects To Required Page  ${vs_matchcenter}

Verify user clicks on in-app notification redirects to Photos Detail
    Click On In App Notification  ${in_app_photos_button}
    Verify In App Notification Redirects To Required Page  ${photo_title_big}

Verify user clicks on in-app notification redirects to Video Detail
    Click On In App Notification  ${in_app_videos_button}
    Verify In App Notification Redirects To Required Page  ${video_title_big}


