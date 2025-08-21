# #############################
# # Security Group Variable
# #############################
variable "security_groups" {
  type        = any
  description = "Security groups configuration"
  sensitive   = false
}