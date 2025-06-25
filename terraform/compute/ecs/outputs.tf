# Exporta el ID (ARN) del clúster ECS creado, útil para otras integraciones como monitoreo o CI/CD.
output "cluster_id" {
  description = "ARN del ECS Cluster"
  value       = aws_ecs_cluster.this.id
}

# Exporta el nombre del servicio ECS, necesario para actualizaciones posteriores o despliegues forzados.
output "service_name" {
  description = "Nombre del ECS Service"
  value       = aws_ecs_service.service.name
}

# Proporciona el DNS público del ALB, que puede usarse para acceder a la app desde fuera.
output "alb_dns_name" {
  description = "DNS público del Application Load Balancer"
  value       = aws_lb.alb.dns_name
}

# Exporta el ARN Suffix del ALB, necesario para configurar dashboards de CloudWatch.
output "alb_arn_suffix" {
  description = "ARN Suffix del Application Load Balancer"
  value       = aws_lb.alb.arn_suffix
}

