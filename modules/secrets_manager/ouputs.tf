###---Secret
output "secret_arn" {
  description = "The ARN of the secret"
  value       = try(aws_secretsmanager_secret.my_secret.arn, null)
}

output "secret_id" {
  description = "The ID of the secret"
  value       = try(aws_secretsmanager_secret.my_secret.id, null)
}


###---Version
output "secret_version_id" {
  description = "The unique identifier of the version of the secret"
  value       = try(aws_secretsmanager_secret_version.my_secret_version.version_id, null)
}