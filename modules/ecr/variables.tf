variable "ecr_repos" {
  type        = map(any)
  description = "List of ECR repos and configs, see example in default"
  default = {
    "career_service" = {
      name = "career"
      tags = {
        Name        = "career"
        Description = "Career Service ECR"
        Environment  = "dev"
      }
    }
  }
}

variable "tags" {
  type        = map(any)
  description = "Tags for resources"
  default = {
    "tags" = {
      Terraform  = "true"
      Environment = "Samanja-io-infra"
    }
  }
}