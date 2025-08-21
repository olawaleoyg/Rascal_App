terraform {
  required_version = "~> 1.3"

  backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}


module "vpc" {
  source = "../modules/vpc"

  vpc_name                   = var.vpc_name
  public_subnets             = var.public_subnets
  private_subnets            = var.private_subnets
  vpc_cidr                   = var.vpc_cidr
  database_subnets           = var.database_subnets
  database_subnet_group_name = var.database_subnet_group_name
  region                     = var.region
}

# module "rds" {
#   source = "../modules/rds"

#   rds_db                     = var.rds_db
#   database_subnet_group_name = var.database_subnet_group_name

# }

module "ecr" {
  source = "../modules/ecr"

  ecr_repos = var.ecr_repos

}

module "iam_user" {
  source = "../modules/iam_user"

  for_each                      = toset(local.users)
  name                          = each.value
  force_destroy                 = true
  create_user                   = true
  create_iam_user_login_profile = false
  password_length               = 30
  permissions_boundary          = ""
  create_iam_access_key         = false
  password_reset_required       = true

}




# # module "security_group" {
# #   source = "../modules/security-group"

# #   security_groups = var.security_groups
# # }
