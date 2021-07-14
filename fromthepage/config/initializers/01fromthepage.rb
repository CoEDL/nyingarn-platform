ADMIN_EMAILS = ENV['ADMIN_EMAILS']
SENDING_EMAIL_ADDRESS = ENV['SENDING_EMAIL_ADDRESS']
SMTP_ENABLED = ENV['SMTP_ENABLED']
USE_PNG_LOGO = ENV['USE_PNG_LOGO']
GUEST_DEED_COUNT = ENV['GUEST_DEED_COUNT']
GUEST_TRANSCRIPTION_ENABLED = ENV['GUEST_TRANSCRIPTION_ENABLED']
FACEBOOK_PIXEL_ID = ENV['FACEBOOK_PIXEL_ID']
MIXPANEL_ID = ENV['MIXPANEL_ID']
GA_ACCOUNT = ENV['GA_ACCOUNT']
#single sign on options below
ENABLE_GOOGLEOAUTH = ENV['ENABLE_GOOGLEOAUTH']
GOOGLE_CLIENT_ID = ENV['GOOGLE_CLIENT_ID']
GOOGLE_CLIENT_SECRET = ENV['GOOGLE_CLIENT_SECRET']
ENABLE_SAML = ENV['ENABLE_SAML']
#IDP_SSO_TARGET_URL = 'your.saml.url'
#IDP_SSO_TARGET_URL = 'https://capriza.github.io/samling/samling.html' #easy test for saml without a saml server
#the below isn't a reference to the cert file, but the actual cert.  See https://github.com/omniauth/omniauth-saml for other options, like fingerprint.
#the initializer/devise.rb file is where this is used, and if you want to use fingerprint rather than cert, you can modify that file
IDP_CERT = ENV['IDP_CERT'] 

# ReCAPTCHA Settings
RECAPTCHA_SITE_KEY = ENV['RECAPTCHA_SITE_KEY']
RECAPTCHA_SECRET_KEY = ENV['RECAPTCHA_SECRET_KEY']

INTERCOM_APP_ID = ENV['INTERCOM_APP_ID']
INTERCOM_ACCESS_TOKEN = ENV['INTERCOM_ACCESS_TOKEN']

# Nice Levels for Rake Import. See `nice_rake.rb`
NICE_RAKE_ENABLED = true
NICE_RAKE_LEVEL = 10 # Values values -20 to 19 (only root can set less than 0)

# Credentials for using MinIO as storage backend
MINIO_ACCESS_KEY = ENV['MINIO_ACCESS_KEY']
MINIO_SECRET_KEY = ENV['MINIO_SECRET_KEY']