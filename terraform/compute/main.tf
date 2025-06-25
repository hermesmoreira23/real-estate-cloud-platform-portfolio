# ECS Fargate - main.tf
# Este archivo define todos los recursos necesarios para desplegar una aplicación 
# contenida en un clúster ECS utilizando Fargate como entorno de ejecución. 
# Incluye el ALB, Target Group, Listener HTTPS, definición de tarea y servicio ECS.

# --- Clúster ECS ---
# Se crea un clúster ECS con tags que identifican el proyecto y entorno.
resource "aws_ecs_cluster" "this" {
  name = var.cluster_name

  tags = {
    Name        = var.cluster_name
    Project     = var.project_tag
    Environment = var.environment
  }
}

# --- Application Load Balancer (ALB) ---
# Balanceador de carga tipo "application" que recibe tráfico externo.
# Está asociado a subredes públicas y protegido con un security group.
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

# --- Target Group ---
# Grupo de destino para las tareas ECS. Recibe el tráfico desde el ALB.
# Se configura con un health check que verifica la disponibilidad del contenedor.
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

# --- Listener HTTPS ---
# Listener del ALB que escucha en el puerto 443 y reenvía el tráfico al target group.
# Utiliza un certificado SSL de ACM proporcionado como variable.
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

# --- ECS Task Definition ---
# Define la especificación de la tarea que se desplegará en Fargate.
# Incluye la imagen Docker, el puerto y configuración de logs en CloudWatch.
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

# --- ECS Service ---
# Servicio ECS que gestiona el ciclo de vida de las tareas Fargate.
# Está conectado al target group del ALB y se lanza en subredes privadas.
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
