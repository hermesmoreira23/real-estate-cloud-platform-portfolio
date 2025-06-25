# ARN de la alarma de CPU alta en EC2:
# - Puede usarse para asociarla a notificaciones más adelante.

output "ec2_alarm_arn" {
  description = "ARN de la alarma de CPU alta en EC2"
  value       = aws_cloudwatch_metric_alarm.ec2_cpu_high.arn
}

# Nombre del dashboard creado:
# - Útil si se quiere referenciar desde otros módulos o herramientas externas.
output "ecs_dashboard_name" {
  description = "Nombre del dashboard de CloudWatch para ECS y ALB"
  value       = aws_cloudwatch_dashboard.ecs_dashboard.dashboard_name
}
