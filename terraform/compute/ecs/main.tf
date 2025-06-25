# 1. Defino un clúster ECS que será el entorno donde desplegaré mis servicios Fargate.
# El nombre del clúster se recibe como variable externa (var.cluster_name).

resource "aws_ecs_cluster" "this" {
  name = var.cluster_name
}

# 2. Creo un Application Load Balancer (ALB) que distribuirá el tráfico entrante.
# Se asocia a subredes públicas y a un Security Group específico para el ALB.
resource "aws_lb" "alb" {
  name               = "${var.cluster_name}-alb"
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.public_subnet_ids
}

# 3. Este Target Group representa el grupo de destino donde el ALB enviará las solicitudes.
# Está configurado para enrutar tráfico HTTP al puerto del contenedor.
# También define un health check para asegurar que las tareas estén sanas.
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
}

# 4. Listener HTTPS que escucha en el puerto 443.
# Este listener asocia el certificado SSL de ACM y enruta tráfico al target group.
# Permite que las aplicaciones expuestas estén protegidas por HTTPS.
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

# 5. Defino una ECS Task Definition compatible con Fargate.
# Especifica CPU, memoria, imagen del contenedor, puertos expuestos y configuración de logs.
# Aquí es donde declaro cómo se ejecuta el contenedor dentro de AWS.
resource "aws_ecs_task_definition" "app" {
  family                   = var.service_name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name      = var.service_name
      image     = var.container_image
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/${var.cluster_name}"
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = var.service_name
        }
      }
    }
  ])
}

# 6. Finalmente creo el ECS Service que lanza la aplicación en Fargate.
# Este servicio gestiona cuántas tareas deben estar en ejecución.
# Asocia las tareas al ALB, las conecta a subredes privadas y define el SG del contenedor.
# También se asegura que el listener HTTPS esté creado antes de lanzar el servicio.
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
}
