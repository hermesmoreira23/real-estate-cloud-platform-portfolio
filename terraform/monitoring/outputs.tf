# ===============================
# 🔧 Outputs del módulo monitoring
# ===============================

output "ec2_alarm_arn" {
  description = "ARN de la alarma de CPU alta en EC2"
  value       = aws_cloudwatch_metric_alarm.ec2_cpu_high.arn
}

output "ecs_dashboard_name" {
  description = "Nombre del dashboard de CloudWatch para ECS y ALB"
  value       = aws_cloudwatch_dashboard.ecs_dashboard.dashboard_name
}
