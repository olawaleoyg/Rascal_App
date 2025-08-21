

variable "aws_region" {
  description = "AWS region where the ECS resources will be created"
  default     = "eu-west-2"
}

# variable "cluster_name" {
#   description = "Name for the ECS cluster"
#   default     = "samanja-prod-frontend"
# }

# variable "samanja-ai_task_definition_family" {
#   description = "Task Definition Family for Task 1"
#   default     = "mvp-task-definition-family"
# }

# variable "samnaja-ai_image" {
#   type        = string
#   description = "Tags for resources"
#   default     = "062000045886.dkr.ecr.eu-west-2.amazonaws.com/frontend_landing_page:mvp"
# }

# variable "samanja-ai_container_name" {
#   description = "Name of the container for Task 1"
#   default     = "mvp-container"
# }

# variable "container_port" {
#   description = "Container port for Task 1"
#   type = number
#   default     = 5173
# }

# variable "samanja-ai_service_name" {
#   description = "Name of Service for Task Definition 1"
#   default     = "mvp-service-name"
# }

# variable "samanja-ai_target_group_name" {
#   description = "Name of Target Group for Task Definition 1"
#   default     = "mvp-target-group"
# }

# variable "public_subnets_ids" {
#   type = list(string) 
# }

# variable "vpc_id" {

#   type = string  
# }

# variable "certificate_arn" {
#   type = string
#   default = "arn:aws:acm:eu-west-2:430471137496:certificate/f8468306-221d-43f5-8a68-a6b04e3c6b24"
  
# }


# variable "cidr_block"  {
#     type = string
#     default = "10.0.0.0/16"
# }

# variable "instance_tenancy" {
#     type = string
#     default = "default"
# }

# variable "enable_dns_hostnames"  {
#     type = bool
#     default = "true"
# }

# variable "tag" {
#     type = string
#     default = "testing"
# }


