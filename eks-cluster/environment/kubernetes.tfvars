################
# EKS variables
################
cluster_version = "1.30"
cluster_name    = "samanja-io-cluster"

admin_usernames     = ["stillashbeck@gmail.com"]
developer_usernames = ["stillashbeck@gmail.com"]
admin_roles         = ["Administrators"]


##################
# SERVICE ACCOUNTS
##################

service_account_role = {
  Service-Account-Role = {
    role_name   = "service-account"
    role_description = "role for Service-Account-Role"
    create_role = true
    role_policy_arns = {
      AWSKeyManagementServicePowerUser = "arn:aws:iam::aws:policy/AdministratorAccess"
    }

    oidc_providers = {
      one = {
        namespace_service_accounts = ["argocd:argocd-image-updater", "gitlab-runner:gitlab-runner", "samanja-runner:runner" ]
      }
    }
    tags = {
      Name = "Service-Account-Role"
    }
  }
}