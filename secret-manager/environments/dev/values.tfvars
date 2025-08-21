#aws_region = "eu-west-2"

name = "dev-secrets"

description = "secrets for dev environmemt"

##edit accordinly
secret_data = {

  username = "",
  password = "",
  OPEN-AI-KEY = "",
  SLACK_BOT_TOKEN = "",
  SLACK_APP_TOKEN = "",
  ACCESS_TOKEN_EXPIRES = "",
  APP_SECRET = "",
  GITHUB_CLIENT_ID = "",
  GITHUB_CLIENT_SECRET = "",
  GOOGLE_CLIENT_ID = "",
  GOOGLE_CLIENT_SECRET = "",
  LINKEDIN_CLIENT_ID = "",
  LINKEDIN_CLIENT_SECRET = "",
  REDIS_HOST = "",
  REDIS_PASSWORD = "",
  REDIS_PORT = "",
  REDIS_USER = "",
  MONGO_HOST = "",
  MONGO_PORT = "",
  MONGO_ROOT_USERNAME = "",
  MONGO_ROOT_PASSWORD = "",
  CLIENT_APP_URL = "",
  AWS_SECRET_ACCESS_KEY = "",
  GITLAB_PRIVATE_KEY = "",
  GITLAB_PROJECT_ID = "",
  VIMEO_ACCESS_TOKEN = "",
  AWS_S3_ACCESS_KEY = "",
  AWS_S3_SECRET_KEY = "",
  MAIL_HOST = "",
  MAIL_USERNAME = "",
  MAIL_PASSWORD = "",
  MAIL_PORT = "",
  STRIPE_API_VERSION = "",
  STRIPE_SECRET_KEY = "",
  STRIPE_WEBHOOK_SECRET = "",
  PAYSTACK_SECRET_KEY = "",
  JITSI_APP_ID = "",
  JITSI_PRIVATE_KEY = "",
  JITSI_KID = "",
  JWT_SECRET = "",
  ZOOM_API_KEY = "",
  ZOOM_API_SECRET = "",
  POSTGRES_DB = "",
  POSTGRES_HOST = "",
  POSTGRES_PASSWORD = "",
  POSTGRES_PORT = "",
  POSTGRES_USER = "",
  REDIS_USERNAME = ""

  # Add more secret key-value pairs as needed
}

tags = {
  Environment     = "dev"
  Department      = ""
  Owner-Email     = ""
  Managed-By      = "Terraform"
  Billing-Account = ""
}

kms_key_id = null

recovery_window_in_days = 30