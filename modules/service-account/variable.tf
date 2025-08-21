##########################################
# IAM EKS Service Account Role Variable
##########################################

variable "service_account_role" {
  type        = map(any)
  description = "AWS EKS Service Account Role"
  sensitive   = false
}


variable "policy_name_prefix" {
  type = string
}

variable "oidc_providers" {
  type = map(any)
  description = "Eks oidc_providers value"
}


variable "tags" {
  type        = map(string)
  description = "Tags for resources"
  default = {
    "Terraform"  = "true"
    "Environment" = "Samanja-infra"
  }
}