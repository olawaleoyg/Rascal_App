
# Service 1
resource "aws_ecs_service" "samanja-ai_service" {
  name                               = var.samanja-ai_service_name
  cluster                            = aws_ecs_cluster.landing_page_frontend.id
  task_definition                    = aws_ecs_task_definition.samanja-ai-landing.arn
  launch_type                        = "FARGATE"
  desired_count                      = 1
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  scheduling_strategy                = "REPLICA"
  deployment_controller {
    type = "ECS"
  }

  network_configuration {
    assign_public_ip = "true"
    subnets          = var.public_subnets_ids
    security_groups  = [aws_security_group.service_security_group.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.samanja-ai_target_group.arn
    container_name   = var.samanja-ai_container_name
    container_port   = var.container_port
  }



  enable_ecs_managed_tags = true
  propagate_tags          = "SERVICE"
  tags = {
    Name = "mvp_service"
  }
}



# Security Group for Service 1
resource "aws_security_group" "service_security_group" {
  name        = "samanja-ai-service-security-group"
  description = "Security group for Service"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 5173
    to_port         = 5173
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "service-sg"
  }
}

