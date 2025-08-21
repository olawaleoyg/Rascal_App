
# Task Definition 1
resource "aws_ecs_task_definition" "samanja-ai-landing" {
  family                   = var.samanja-ai_task_definition_family
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "1024"
  memory                   = "3072"


  execution_role_arn = aws_iam_role.ecs_execution_role.arn

  container_definitions = jsonencode([
    {
      name  = var.samanja-ai_container_name
      image = var.samanja-ai_image
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
        },
      ],
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "ecs-logs"
          "awslogs-region"        = var.aws_region
          "awslogs-stream-prefix" = var.samanja-ai_container_name
          "awslogs-create-group"  = "true"
        }
      },
      #environment = var.gitlab_environment_vars_1
    },
  ])

  tags = {
    Name = "samanja-ai_definition"
  }
}

