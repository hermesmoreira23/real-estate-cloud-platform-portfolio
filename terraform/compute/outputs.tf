output "public_ip" {
  description = "IP pública de la instancia EC2"
  value       = aws_instance.web.public_ip
}

output "web_instance_id" {
  description = "ID de la instancia EC2"
  value       = aws_instance.web.id
}

output "alb_arn_suffix" {
  description = "ARN suffix del ALB para usarlo en CloudWatch"
  value       = aws_lb.main.arn_suffix
}
