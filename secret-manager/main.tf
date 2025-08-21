module "my_secret_manager" {
  source                  = "./modules/secrets_manager"

  name                    = var.name
  description             = var.description
  secret_data             = var.secret_data
  recovery_window_in_days = var.recovery_window_in_days
  kms_key_id              = var.kms_key_id

}

