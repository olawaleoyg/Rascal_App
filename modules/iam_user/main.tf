# User module
module "iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.1.0"

  name                          = var.name
  force_destroy                 = var.force_destroy
  create_user                   = var.create_user
  create_iam_user_login_profile = false ## Managed by resource aws_iam_user_login_profile.this # var.create_iam_user_login_profile
  password_length               = var.password_length
  permissions_boundary          = var.permissions_boundary
  create_iam_access_key         = var.create_iam_access_key
  password_reset_required       = var.password_reset_required

}

resource "aws_iam_user_login_profile" "this" {
  user                    = module.iam_user.iam_user_name
  pgp_key                 = ""
  password_length         = var.password_length
  password_reset_required = var.password_reset_required
  depends_on = [
    module.iam_user
  ]
  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
    ]
  }
}