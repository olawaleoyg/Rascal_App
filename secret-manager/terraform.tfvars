aws_region = "eu-west-2"

name = "dev-secrets"

description = "secrets for dev environment"

##----- edit accordinly
secret_data = {
  
  
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