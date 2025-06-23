# =======================================================================================
# ECS Fargate Module - main.tf
# Despliega un clúster ECS con un Application Load Balancer, Target Group, Listener,
# definición de tarea y servicio ECS. Todo orquestado sobre Fargate.
# =======================================================================================

# 1️⃣ ECS Cluster
resource "aws_ecs_cluster" "this" {
  name = var.cluster_name

  tags = {
    Name        = var.cluster_name
    Project     = var.project_tag
    Environment = var.environment
  }
}

# 2️⃣ Application Load Balancer (ALB)
resource "aws_lb" "alb" {
  name               = "${var.cluster_name}-alb"
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.public_subnet_ids

  tags = {
    Name        = "${var.cluster_name}-alb"
    Project     = var.project_tag
    Environment = var.environment
  }
}

# 3️⃣ Target Group que recibe tráfico del ALB y lo direcciona a las tareas ECS
resource "aws_lb_target_group" "tg" {
  name     = "${var.cluster_name}-tg"
  port     = var.container_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200-399"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name        = "${var.cluster_name}-tg"
    Project     = var.project_tag
    Environment = var.environment
  }
}

# 4️⃣ Listener HTTPS que conecta el ALB con el Target Group
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.acm_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

# 5️⃣ Definición de la Tarea (Task Definition)
resource "aws_ecs_task_definition" "app" {
  family                   = var.service_name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name      = var.service_name
    image     = var.container_image
    portMappings = [{
      containerPort = var.container_port
      hostPort      = var.container_port
    }]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = "/ecs/${var.cluster_name}"
        awslogs-region        = var.aws_region
        awslogs-stream-prefix = var.service_name
      }
    }
  }])
}

# 6️⃣ ECS Service que lanza las tareas Fargate
resource "aws_ecs_service" "service" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.private_subnet_ids
    security_groups = [var.ecs_security_group_id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.tg.arn
    container_name   = var.service_name
    container_port   = var.container_port
  }

  depends_on = [aws_lb_listener.https]

  tags = {
    Name        = var.service_name
    Project     = var.project_tag
    Environment = var.environment
  }
}
