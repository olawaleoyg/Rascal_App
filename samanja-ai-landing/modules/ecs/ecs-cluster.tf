

# Create ECS Cluster
resource "aws_ecs_cluster" "landing_page_frontend" {
  name = var.cluster_name
  tags = {
    Name = "ecs-cluster"
  }

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
