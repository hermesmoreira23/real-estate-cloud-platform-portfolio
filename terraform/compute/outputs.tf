# Outputs del módulo compute
# Estos outputs exponen valores clave del módulo para poder usarlos desde el módulo raíz
# o desde otros módulos como monitoring, DNS, etc.

# Dirección IP pública de la instancia EC2.
# Útil para conectarse vía SSH o acceder a la aplicación si no está detrás del ALB.
output "public_ip" {
  description = "IP pública de la instancia EC2"
  value       = aws_instance.web.public_ip
}

# ID único de la instancia EC2 lanzada.
# Puede utilizarse para monitoreo o para asociar alarmas CloudWatch específicas.
output "web_instance_id" {
  description = "ID de la instancia EC2"
  value       = aws_instance.web.id
}

# ARN Suffix del Load Balancer.
# Este valor es necesario para algunos recursos de AWS, como dashboards de CloudWatch
# donde se debe especificar el `LoadBalancer` como `alb/xxx/yyy` en la dimensión.
output "alb_arn_suffix" {
  description = "ARN suffix del ALB para usarlo en CloudWatch"
  value       = aws_lb.main.arn_suffix
}
