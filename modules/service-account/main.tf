module "iam_eks_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.11.1"

  
  role_name          = var.service_account_role
  create_role        = true
  policy_name_prefix = lookup("${var.service_account_role}")
  role_description   = lookup("${var.service_account_role}")
  role_policy_arns   = lookup("${var.service_account_role}")
  oidc_providers     = var.oidc_providers
  tags = var.tags

  depends_on = [
    module.eks,
  ]
}