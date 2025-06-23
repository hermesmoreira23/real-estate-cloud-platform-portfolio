variable "ec2_instance_id" {
  description = "ID de la instancia EC2 a monitorizar"
  type        = string
}

variable "cluster_name" {
  description = "Nombre del ECS cluster para el dashboard"
  type        = string
}

variable "alb_arn_suffix" {
  description = "ARN suffix del ALB"
  type        = string
}

variable "aws_region" {
  description = "Región AWS"
  type        = string
}

variable "project_tag" {
  description = "Tag del proyecto para organización"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue (dev, prod, etc.)"
  type        = string
}
