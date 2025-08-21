module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "~> 1.5"

  aliases               = ["eks/${var.cluster_name}"]
  description           = "${var.cluster_name} cluster encryption key"
  enable_default_policy = true
  key_owners            = [data.aws_caller_identity.current.arn]


  tags = {
    Environment = "samanja-infra"
    Terraform   = "true"
  }
}