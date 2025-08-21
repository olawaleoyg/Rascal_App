################
# EKS variables
################

variable "cluster_name" {
  type = string
}

variable "kafka_instance_name" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "create_revamp_kafka" {
  type = bool
  default = false
}

variable "cluster_endpoint_private_access" {
  type    = bool
  default = true
}

variable "cluster_endpoint_public_access" {
  type    = bool
  default = true
}

variable "namespaces" {
  type        = list(string)
  description = "Kubernetes namespaces to create"
  default     = []
}

variable "eks_managed_node_groups" {
  type = map(any)
}

variable "manage_aws_auth_configmap" {
  type    = bool
  default = true
}

variable "developer_usernames" {
  type        = list(string)
  description = "Names of developers for aws_auth map and namespaces"
}

variable "admin_usernames" {
  type        = list(string)
  description = "Name of admin users"
}

variable "admin_roles" {
  type        = list(string)
  description = "Name of admin roles and service accounts"
}


##########################################
# IAM EKS Service Account Role Variable
##########################################

variable "service_account_role" {
  type        = map(any)
  description = "AWS EKS Service Account Role"
  sensitive   = false
}


variable "tags" {
  type        = map(string)
  description = "Tags for resources"
  default = {
    "Terraform"  = "true"
    "Environment" = "Samanja-io-infra"
  }
}

variable "users" {
  type = map(any)
  description = "auth users, developers and admin" 
}

variable "aws_auth_roles" {
  type = map(any)
  description = "auth roles" 
}