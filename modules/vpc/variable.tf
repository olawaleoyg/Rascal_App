# ################
# # VPC variables
# ################
variable "region" {
  type        = string
  description = "Region to deploy resources"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "private_subnets" {
  type        = list(any)
  description = "Blue Private subnets cidrs"
}

variable "public_subnets" {
  type        = list(any)
  description = "Blue Public subnets cidrs"
}

variable "database_subnets" {
  type        = list(string)
  description = "Database subnets"
  default     = []
}

variable "database_subnet_group_name" {
  type        = string
  description = "Name for database subnet group name"
  default     = ""
}


variable "tags" {
  type        = map(string)
  description = "Tags for resources"
  default = {
    "Terraform"  = "true"
    "Environment" = "Samanja-infra"
  }
}


variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "enable_dns_support" {
  type    = bool
  default = true
}

variable "enable_nat_gateway" {
  type    = bool
  default = true
}

variable "single_nat_gateway" {
  type    = bool
  default = true
}

variable "one_nat_gateway_per_az" {
  type    = bool
  default = false
}

variable "create_database_subnet_group" {
  type    = bool
  default = true
}

