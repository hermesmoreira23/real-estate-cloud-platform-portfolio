output "cluster_id" {
  description = "ARN del ECS Cluster"
  value       = aws_ecs_cluster.this.id
}

output "service_name" {
  description = "Nombre del ECS Service"
  value       = aws_ecs_service.service.name
}

output "alb_dns_name" {
  description = "DNS público del Application Load Balancer"
  value       = aws_lb.alb.dns_name
}

