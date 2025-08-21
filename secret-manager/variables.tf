variable "aws_region" {
  description = "AWS region"
}

variable "name" {
  description = "Name of the secret in AWS Secrets Manager"
}

variable "secret_data" {
  description = "Map of secret data"
  type        = map(string)
  default     = {}
  sensitive   = true
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "kms_key_id" {
  description = "ARN or Id of the AWS KMS key to be used to encrypt the secret values in the versions stored in this secret. If you need to reference a CMK in a different account, you can use only the key ARN. If you don't specify this value, then Secrets Manager defaults to using the AWS account's default KMS key (the one named `aws/secretsmanager`"
  type        = string
  default     = "aws/secretsmanager"
}

variable "recovery_window_in_days" {
  description = "Number of days that AWS Secrets Manager waits before it can delete the secret. This value can be `0` to force deletion without recovery or range from `7` to `30` days. The default value is `30`"
  type        = number
  default     = 30
}

variable "description" {
  description = "A description of the secret"
  type        = string
  default     = "secrets for dev environment"
}