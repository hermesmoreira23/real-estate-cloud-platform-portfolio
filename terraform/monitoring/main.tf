# Alarma de uso alto de CPU en EC2
# - Dispara si el promedio de CPU supera el 70% durante 10 minutos (2 periodos de 5 min)
# - Las acciones están desactivadas por ahora (no envía notificaciones)
resource "aws_cloudwatch_metric_alarm" "ec2_cpu_high" {
  alarm_name          = "High-CPU-EC2"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "Alarma si la CPU de EC2 supera el 70% durante 10 minutos"
  actions_enabled     = false

  dimensions = {
    InstanceId = var.ec2_instance_id
  }

  tags = {
    Name        = "High-CPU-EC2"
    Project     = var.project_tag
    Environment = var.environment
  }
}

# Dashboard personalizado de CloudWatch
# - Muestra métricas de ECS y ALB en una sola vista
# - Se crea con widgets configurados en JSON
resource "aws_cloudwatch_dashboard" "ecs_dashboard" {
  dashboard_name = "ecs-${var.environment}-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric",
        x    = 0,
        y    = 0,
        width = 12,
        height = 6,
        properties = {
          metrics = [
            [ "AWS/ECS", "CPUUtilization", "ClusterName", var.cluster_name, { "stat": "Average" } ]
          ],
          period = 300,
          title  = "ECS CPU Utilization",
          region = var.aws_region
        }
      },
      {
        type = "metric",
        x    = 12,
        y    = 0,
        width = 12,
        height = 6,
        properties = {
          metrics = [
            [ "AWS/ApplicationELB", "RequestCount", "LoadBalancer", var.alb_arn_suffix, { "stat": "Sum" } ]
          ],
          period = 300,
          title  = "ALB Request Count",
          region = var.aws_region
        }
      }
    ]
  })
}

