provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.5.2"  # Replace with the appropriate version
  
  name             = "your-vpc-name"
  cidr             = var.vpc_cidr_block
  azs              = [ "us-east-1a", "us-east-1b", "us-east-1c" ]
  private_subnets  = [ element(var.subnets, 0), element(var.subnets, 1), element(var.subnets, 2) ]
  public_subnets   = var.public_subnets  # Use the variable for public subnets
  enable_nat_gateway = true
  enable_dns_support   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "enable_public_ip" = "true"
}
}

module "ecr" {
  source = "terraform-aws-modules/ecr/aws"
  version = "1.3.2"  # Replace with the appropriate version

  repository_name = var.ecr_repository_name

  repository_read_write_access_arns = ["arn:aws:iam::012345678901:role/terraform"]
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 30 images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = 30
        },
        action = {
          type = "expire"
        }
      }
    ]
  })

  tags = var.ecs_tags
}

module "ecs" {
  source = "terraform-aws-modules/ecs/aws"

  cluster_name          = var.ecs_cluster_name
  cluster_configuration = var.ecs_cluster_configuration
  services = {
    fargate_service = {
      launch_type = "FARGATE"
      desired_count = 1
      task_definition_family = var.task_definition_family
      task_definition_container_definitions = [
        {
          name  = var.container_name
          image = module.ecr.repository_url  # Use the ECR module output
          portMappings = [
            {
              containerPort = 80,
              hostPort      = 80,
            },
          ]
          log_configuration = {
            logDriver = "awslogs"
            options = {
              "awslogs-group"  = "/ecs/${var.ecs_cluster_name}"
              "awslogs-region" = var.aws_region
              "awslogs-stream-prefix" = var.container_name
            }
          }
        },
      ]
      service_configuration = {
        name = var.service_name
        launchType = "FARGATE"
        platformVersion = "LATEST"
        capacity_provider_strategy = [
          {
            capacity_provider = "FARGATE",
            weight            = 1,
          },
          {
            capacity_provider = "FARGATE_SPOT",
            weight            = 0,
          },
        ]
        deployment_controller = {
          type = "ECS"
        }
      }
      service_autoscaling = {
        min_capacity = 1
        max_capacity = 2
        metric_name  = "ALBRequestCountPerTarget"
        target_value = 10
        policy_name  = var.autoscaling_policy_name
      }
      load_balancer = {
        elb_name          = var.elb_name
        target_group_name = var.target_group_name
        container_name    = var.container_name
        container_port    = 80
        listener = [
          {
            container_port = 80,
            host_port      = 80,
            protocol       = "HTTP",
            target_group_name = var.target_group_name
          },
        ]
      }
    }
  }
  tags = var.ecs_tags

  #subnet_ids = module.vpc.private_subnets
}