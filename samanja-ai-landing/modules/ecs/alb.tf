
# Target Group 1
resource "aws_lb_target_group" "samanja-ai_target_group" {
  name        = var.samanja-ai_target_group_name
  port        = var.container_port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
  tags = {
    Name = "samanja-ai-tg"
  }
  depends_on = [aws_lb.samanja-ai_alb]
}

# ALB 1
resource "aws_lb" "samanja-ai_alb" {
  name               = "samanja-ai-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_security_group.id]
  subnets            = var.public_subnets_ids
  tags = {
    Name = "samanja-ai-alb"
  }
}

# ALB Listener 1 (HTTPS)
resource "aws_lb_listener" "https_listener-samanja-ai" {
  load_balancer_arn = aws_lb.samanja-ai_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.samanja-ai_target_group.arn
  }
}

resource "aws_lb_listener" "samanja-ai_alb_listener" {
  load_balancer_arn = aws_lb.samanja-ai_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "redirect"
    redirect {
      protocol       = "HTTPS"
      port           = "443"
      status_code    = "HTTP_301"
    } 
  }
depends_on = [ aws_lb_listener.https_listener-samanja-ai ]
}

# ALB Security Group 1
resource "aws_security_group" "alb_security_group" {
  name        = "alb-security-group"
  description = "Security group for Application Load Balancers"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "alb-sg"
  }
}

