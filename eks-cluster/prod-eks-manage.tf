###########################################################
################ EKS-MANAGED-NODE-GROUP ###################
###########################################################

module "prod_eks_managed_node_group" {
  source  = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  version = "20.8.3"

  name            = "prod-eks-mng"
  cluster_name    =  var.cluster_name
  cluster_version = var.cluster_version

  subnet_ids = local.prod_private_subnet_ids

  // The following variables are necessary if you decide to use the module outside of the parent EKS module context.
  // Without it, the security groups of the nodes are empty and thus won't join the cluster.
  cluster_primary_security_group_id = module.eks.cluster_primary_security_group_id
  vpc_security_group_ids            = [module.eks.node_security_group_id]
  cluster_service_cidr              = var.cluster_service_cidr

  // Note: `disk_size`, and `remote_access` can only be set when using the EKS managed node group default launch template
  // This module defaults to providing a custom launch template to allow for custom security groups, tag propagation, etc.
  // use_custom_launch_template = false
  // disk_size = 50
  //
  //  # Remote access cannot be specified with a launch template
  //  remote_access = {
  //    ec2_ssh_key               = module.key_pair.key_pair_name
  //    source_security_group_ids = [aws_security_group.remote_access.id]
  //  }

  min_size     = 1
  max_size     = 10
  desired_size = 3

  instance_types = ["t3.large"]
  capacity_type  = "ON_DEMAND"

  labels = {
    Environment = "prod"
    GithubRepo  = "terraform-aws-eks"
    GithubOrg   = "terraform-aws-modules"
  }
  iam_role_additional_policies = {
    additional                      = aws_iam_policy.additional.arn
    AmazonEBSCSIDriverPolicy        = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
    EKSNodegroupClusterIssuerPolicy = aws_iam_policy.eks_nodegroup_cluster_issuer_policy.arn
    EKSNodegroupExternalDNSPolicy   = aws_iam_policy.eks_nodegroup_exteral_dns_policy.arn
    cluster-autoscaler-policy       = aws_iam_policy.cluster_autoscaler_policy_for_eks.arn
    EKSNodegroupFullECRAccess       = aws_iam_policy.eks_nodegroup_ecr_full_access.arn
  }
  tags = {
    Environment = "axtern-io-infra"
    Terraform   = "true"
  }
}
