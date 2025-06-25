# ID de la instancia EC2:
# - Especificamos qué instancia debe ser monitorizada con la alarma de CPU.

variable "ec2_instance_id" {
  description = "ID de la instancia EC2 a monitorizar"
  type        = string
}

# Nombre del ECS Cluster:
# - Necesario para mostrar métricas específicas en el dashboard.
variable "cluster_name" {
  description = "Nombre del ECS cluster para el dashboard"
  type        = string
}

# Parte final del ARN del ALB:
# - CloudWatch requiere el sufijo para obtener métricas del balanceador de carga.
variable "alb_arn_suffix" {
  description = "ARN suffix del ALB"
  type        = string
}

# Región de AWS:
# - Donde se están desplegando los recursos y se visualizarán las métricas.
variable "aws_region" {
  description = "Región AWS"
  type        = string
}

# Etiqueta del proyecto:
# - Para organizar los recursos en AWS con un tag común.
variable "project_tag" {
  description = "Tag del proyecto para organización"
  type        = string
}


# Entorno (por ejemplo, dev o prod):
# - Se usa para separar entornos dentro del mismo proyecto.
variable "environment" {
  description = "Entorno de despliegue (dev, prod, etc.)"
  type        = string
}
