output "ec2_alarm_arn" {
  description = "ARN de la alarma de CPU alta en EC2"
  value       = aws_cloudwatch_metric_alarm.ec2_cpu_high.arn
}