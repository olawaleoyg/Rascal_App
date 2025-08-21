module "iam_eks_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.11.1"

  for_each = var.service_account_role

  role_name          = lookup(each.value, "role_name", "")
  create_role        = true
  policy_name_prefix = lookup(each.value, "policy_name_prefix", "")
  role_description   = lookup(each.value, "role_description", "")
  role_policy_arns   = lookup(each.value, "role_policy_arns", "")
  oidc_providers = {
    one = {
      provider_arn = module.eks.oidc_provider_arn
      # allows the service account to be accessed by dev-serviceaccount in dev namespace and stg-serviceaccount in stg namespace while being in different clusters
      namespace_service_accounts = ["argocd:argocd-image-updater", "argocd:argocd","gitlab-runner:gitlab-runner", "axtern-runner:axtern-runner"]
    }
  }
  tags = lookup(each.value, "tags", var.tags)

  depends_on = [
    module.eks,
  ]
}