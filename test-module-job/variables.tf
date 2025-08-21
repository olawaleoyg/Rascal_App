variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnets" {
  description = "A list of subnet configurations"
  type        = list(object({
    name           = string
    cidr_block     = string
    availability_zone = string
    map_public_ip_on_launch = bool
  }))
  default = [
    {
      name           = "subnet-1"
      cidr_block     = "10.0.1.0/24"
      availability_zone = "us-east-1a"
      map_public_ip_on_launch = false
    },
    {
      name           = "subnet-2"
      cidr_block     = "10.0.2.0/24"
      availability_zone = "us-east-1b"
      map_public_ip_on_launch = false
    },
    {
      name           = "subnet-3"
      cidr_block     = "10.0.3.0/24"
      availability_zone = "us-east-1c"
      map_public_ip_on_launch = false
    },
  ]
}
variable "public_subnets" {
  type = list(string)
  default = [ "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24" ]
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  default     = "your-ecr-repo-name"
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "your-ecs-cluster-name"
}

variable "ecs_cluster_configuration" {
  description = "Configuration for ECS cluster"
  default     = {
    execute_command_configuration = {
      logging = "OVERRIDE"
      log_configuration = {
        cloud_watch_log_group_name = "/aws/ecs/aws-ec2"
      }
    }
  }
}

variable "task_definition_family" {
  description = "Family name for the ECS task definition"
  default     = "your-task-family"
}

variable "container_name" {
  description = "Name of the container"
  default     = "your-container-name"
}

variable "service_name" {
  description = "Name of the ECS service"
  default     = "your-ecs-service"
}

variable "elb_name" {
  description = "Name of the Elastic Load Balancer"
  default     = "your-elb-name"
}

variable "target_group_name" {
  description = "Name of the target group"
  default     = "your-target-group"
}

variable "autoscaling_policy_name" {
  description = "Name of the autoscaling policy"
  default     = "your-autoscaling-policy"
}

variable "ecs_tags" {
  description = "Tags for ECS resources"
  type        = map(any)
  default     = {
    Environment = "Development"
    Project     = "Example"
  }
}