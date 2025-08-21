output "user_details" {
  value = {
      name              = module.iam_user.iam_user_name
      password          = aws_iam_user_login_profile.this.password
      access_key_id     = module.iam_user.iam_access_key_id
      secret_access_key = module.iam_user.iam_access_key_secret
    }
}

