#############################
# CREATE CUSTOM SERVICE ACCOUT POLICY
#############################


#############Cluster Autoscaler Policy For EKS################


resource "aws_iam_policy" "cluster_autoscaler_policy_for_eks" {
  name        = "cluster-autoscaler-policy"
  description = "ASG ClusterAutoscalerPolicy"
  policy      = file("policies/ClusterAutoscalerPolicy.json")
}


# ATTACH-ECR-FULL-ACCESs to eks node
resource "aws_iam_policy" "eks_nodegroup_ecr_full_access" {
  name        = "EKSNodegroupFullECRAccess"
  description = "full ecr access to for nodegroup"
  policy      = file("policies/FullECRAccess.json")
}


resource "aws_iam_policy" "eks_nodegroup_cluster_issuer_policy" {
  name        = "EKSNodegroupClusterIssuerPolicy"
  description = "access to cluster certificate issuer stuff"
  policy      = file("policies/ClusterIssuerPolicy.json")
}

resource "aws_iam_policy" "eks_nodegroup_exteral_dns_policy" {
  name        = "EKSNodegroupExternalDNSPolicy"
  description = "access to external dns issuer route53 stuff"
  policy      = file("policies/ExternalDNSPolicy.json")
}

resource "aws_iam_policy" "additional" {
  name = "${var.cluster_name}-additional"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}