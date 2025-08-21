locals {

  ############ EKS ###########
  aws_auth_developers = [
    for developer in var.developer_usernames :
    {
      userarn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${developer}"
      username = "${developer}"
      groups   = ["system:masters"]
    }
  ]

  aws_auth_admins = [
    for admin in var.admin_usernames :
    {
      userarn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${admin}"
      username = "${admin}"
      groups   = ["system:masters"]
    }
  ]

  aws_auth_root_account = [
    {
      userarn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      username = "admin"
      groups   = ["system:masters"]
    }
  ]

  namespaces = concat(var.namespaces)

  aws_auth_roles = [
    for role in var.admin_roles :
    {
      rolearn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${role}"
      username = "${role}"
      groups   = ["system:masters"]
    }
  ]

  ############ PRIVATE SUBNETS ###########
  staging_private_subnet_ids = [data.aws_subnet.private_subnet_1.id, data.aws_subnet.private_subnet_2.id, data.aws_subnet.private_subnet_3.id, data.aws_subnet.private_subnet_4.id]
  prod_private_subnet_ids    = [data.aws_subnet.private_subnet_5.id, data.aws_subnet.private_subnet_6.id, data.aws_subnet.private_subnet_7.id, data.aws_subnet.private_subnet_8.id]
  eks_private_subnet_ids     = [data.aws_subnet.private_subnet_9.id, data.aws_subnet.private_subnet_10.id]
  tooling_private_subnet_ids = [data.aws_subnet.private_subnet_11.id, data.aws_subnet.private_subnet_12.id]
  dev_private_subnet_ids     = [data.aws_subnet.private_subnet_13.id, data.aws_subnet.private_subnet_14.id, data.aws_subnet.private_subnet_15.id, data.aws_subnet.private_subnet_16.id]

  ############ PUBLIC SUBNETS ###########
  public_subnet_ids = [data.aws_subnet.public_subnet_1.id, data.aws_subnet.public_subnet_2.id]

}