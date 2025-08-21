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


variable "tags" {
  type        = map(any)
  description = "Tags for resources"
  default = {
    "tags" = {
      Terraform  = "true"
      Enviroment = "Samanja-io-infra"
    }
  }
}

variable "enable_dns_hostnames" {
  type    = string
  default = true
}

variable "enable_dns_support" {
  type    = string
  default = "true"
}

variable "enable_nat_gateway" {
  type    = string
  default = "true"
}

variable "single_nat_gateway" {
  type    = string
  default = "true"
}

variable "one_nat_gateway_per_az" {
  type    = string
  default = "false"
}

variable "create_database_subnet_group" {
  type    = string
  default = "true"
}

variable "name" {
  type    = string
  default = "demoUser"
}

variable "force_destroy" {
  type    = bool
  default = true
}

variable "create_user" {
  type    = bool
  default = false
}

variable "create_iam_user_login_profile" {
  type    = bool
  default = false
}

variable "password_length" {
  type    = number
  default = 30
}

variable "permissions_boundary" {
  type    = string
  default = ""
}

variable "create_iam_access_key" {
  type    = bool
  default = false
}

variable "password_reset_required" {
  type    = bool
  default = true
}

################################
## Variables for group module
#################################
variable "Groups" {
  description = "IAM User Groups"
}

variable "developer_group_user_attachment" {
  type    = string
  default = "developer_group_user_attachment"
}

variable "administrator_group_user_attachment" {
  type    = string
  default = "administrator_group_user_attachment"
}

##---- variables for rds module
# variable "rds_db" {
#   type        = map(any)
#   description = "Database configuration configuration"
#   sensitive   = false
# }

variable "database_subnet_group_name" {
  type        = string
  description = "Name for database subnet group name"
  default     = ""
}

###---- variables for ecr module
variable "ecr_repos" {
  type        = map(any)
  description = "List of ECR repos and configs, see example in default"
  default = {
    "career_service" = {
      name = "career"
      tags = {
        Name        = "career"
        Description = "Career Service ECR"
        Enviroment  = "dev"
      }
    }
  }
}







# # #############################
# # # Security Group Variable
# # #############################
# variable "security_groups" {
#   type        = any
#   description = "Security groups configuration"
#   sensitive   = false
# }
