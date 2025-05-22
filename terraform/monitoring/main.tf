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
}

