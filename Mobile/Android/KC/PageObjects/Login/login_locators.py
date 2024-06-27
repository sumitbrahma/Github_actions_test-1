# views
login_view = '//android.widget.ScrollView/android.view.ViewGroup'
kc_app = '//android.widget.TextView[@content-desc="Knight Club"]'
# input fields
country_code_field = '//android.widget.TextView[@resource-id="com.knightclub.app:id/tv_country"]'
mobile_field = '//android.widget.EditText[@resource-id="com.knightclub.app:id/et_mobile"]'

#buttons
login_skip_button = '//android.widget.TextView[@resource-id="com.knightclub.app:id/tv_skip"]'
profile_logo_button = '//android.widget.ImageButton[@resource-id="com.knightclub.app:id/btn_profile"]'
# cross_button = '/hierarchy/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.ImageView'
otp_screen = '//android.widget.LinearLayout[@resource-id="com.knightclub.app:id/inc_otp_verification"]'
resend_otp_button = '//android.widget.Button[@resource-id="com.knightclub.app:id/btn_resend"]'

request_otp_btn = '//android.widget.Button[@text="REQUEST OTP"]'

Resend_otp_enable= "//*[@resource-id = 'com.knightclub.app:id/btn_resend' and @enabled='true']"

submit_button = '//android.widget.TextView[@text="SUBMIT"]'
disabled_submit_button = '//android.widget.ScrollView/android.view.ViewGroup/android.widget.LinearLayout/android.widget.LinearLayout[5]'
back_button = '//android.widget.ImageButton[@resource-id="com.knightclub.app:id/btn_back_new"]'

otp_fields = '//android.widget.EditText[@resource-id="com.knightclub.app:id/pv_otp"]'

disclaimer_checkbox = '//android.widget.CheckBox[@resource-id="com.knightclub.app:id/cb_disclaimer"]'
privacy_policy_checkbox = '//android.widget.CheckBox[@resource-id="com.knightclub.app:id/cb_privacy_policy"]'

# titles
homepage_title = '//android.widget.TextView[@resource-id="com.knightclub.app:id/tv_title" and @text="Hey Knight!"]'

# toast
wrong_number_toast = '//android.widget.Toast[@text="Oops! Looks like you have entered the wrong number. Numbers must not include spaces,country code & special characters."]'
blocked_number_toast = '//android.widget.ScrollView/android.view.ViewGroup/android.widget.LinearLayout/android.widget.LinearLayout[5]'

# redirection Links
privacy_policy_link = '//android.widget.TextView[@resource-id="com.knightclub.app:id/tv_privacy_policy"]'
privacy_policy_page_title = '//android.widget.TextView[@resource-id="com.knightclub.app:id/tv_title_new"]'

terms_and_conditions_page_title = '//android.widget.TextView[@resource-id="com.knightclub.app:id/tv_title_new"]'

