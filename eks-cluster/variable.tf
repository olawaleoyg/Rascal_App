variable "cluster_name" {
  type        = string
  description = "CLUSTER NAME"
}

variable "cluster_version" {
  type = string
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

variable "namespaces" {
  type        = list(string)
  description = "Kubernetes namespaces to create"
  default     = []
}

variable "tags" {
  type        = map(any)
  description = "Tags for resources"
  default = {
    "tags" = {
      Terraform  = "true"
      Enviroment = "axtern-io-infra"
    }
  }
}

##########################################
# IAM EKS Service Account Role Variable
##########################################

variable "service_account_role" {
  type        = map(any)
  description = "AWS EKS Service Account Role"
  sensitive   = false
}



variable "cluster_service_cidr" {
  description = "CIDR block for Kubernetes services"
  type        = string
  default     = "10.0.0.0/16" # Replace with your desired CIDR
}