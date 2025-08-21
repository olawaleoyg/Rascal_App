module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
    aws-ebs-csi-driver = {
      most_recent = true
    }
  }


  vpc_id = data.aws_vpc.samanja-vpc.id

  subnet_ids               = local.eks_private_subnet_ids
  control_plane_subnet_ids = local.eks_private_subnet_ids

  # External encryption key
  create_kms_key = false
  cluster_encryption_config = {
    resources        = ["secrets"]
    provider_key_arn = module.kms.key_arn
  }

  iam_role_additional_policies = {
    additional                      = aws_iam_policy.additional.arn
    AmazonEBSCSIDriverPolicy        = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
    EKSNodegroupClusterIssuerPolicy = aws_iam_policy.eks_nodegroup_cluster_issuer_policy.arn
    EKSNodegroupExternalDNSPolicy   = aws_iam_policy.eks_nodegroup_exteral_dns_policy.arn
    cluster-autoscaler-policy       = aws_iam_policy.cluster_autoscaler_policy_for_eks.arn
    EKSNodegroupFullECRAccess       = aws_iam_policy.eks_nodegroup_ecr_full_access.arn
  }



  # Extend cluster security group rules
  cluster_security_group_additional_rules = {
    ingress_nodes_ephemeral_ports_tcp = {
      description                = "Nodes on ephemeral ports"
      protocol                   = "tcp"
      from_port                  = 1025
      to_port                    = 65535
      type                       = "ingress"
      source_node_security_group = true
    }
    # Test: https://github.com/terraform-aws-modules/terraform-aws-eks/pull/2319
    ingress_source_security_group_id = {
      description              = "Ingress from another computed security group"
      protocol                 = "tcp"
      from_port                = 22
      to_port                  = 22
      type                     = "ingress"
      source_security_group_id = aws_security_group.additional.id
    }
  }

  # Extend node-to-node security group rules
  node_security_group_additional_rules = {
    ingress_self_all = {
      description = "Node to node all ports/protocols"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      type        = "ingress"
      self        = true
    }
    # Test: https://github.com/terraform-aws-modules/terraform-aws-eks/pull/2319
    ingress_source_security_group_id = {
      description              = "Ingress from another computed security group"
      protocol                 = "tcp"
      from_port                = 22
      to_port                  = 22
      type                     = "ingress"
      source_security_group_id = aws_security_group.additional.id
    }
  }

  self_managed_node_group_defaults = {}

  self_managed_node_groups = {}

  aws_auth_node_iam_role_arns_non_windows = [
    module.prod_eks_managed_node_group.iam_role_arn,
    module.staging_eks_managed_node_group.iam_role_arn,
    module.tooling_eks_managed_node_group.iam_role_arn
  ]

  aws_auth_fargate_profile_pod_execution_role_arns = [
    # module.fargate_profile.fargate_profile_pod_execution_role_arn
  ]


  #aws-auth configmap
  create_aws_auth_configmap = false
  manage_aws_auth_configmap = false

  aws_auth_roles = local.aws_auth_roles

  aws_auth_users = concat(local.aws_auth_developers, local.aws_auth_admins, local.aws_auth_root_account)

  aws_auth_accounts = [
    tostring(data.aws_caller_identity.current.account_id)
  ]

  tags = {
    Environment = "samanja-infra"
    Terraform   = "true"
  }

  node_security_group_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = null
  }
}