variable "cluster_name" {
  description = "Nombre del cluster ECS"
  type        = string
  default     = "real-estate-cluster"
}

variable "service_name" {
  description = "Nombre del ECS Service"
  type        = string
  default     = "real-estate-service"
}

variable "container_image" {
  description = "URI de la imagen Docker (ECR)"
  type        = string
}

variable "container_port" {
  description = "Puerto en el que escucha el contenedor"
  type        = number
  default     = 8000
}

variable "desired_count" {
  description = "Número de tareas Fargate deseadas"
  type        = number
  default     = 2
}

variable "vpc_id" {
  description = "VPC donde desplegar ALB y Fargate"
  type        = string
}

variable "public_subnet_ids" {
  description = "Lista de subnets públicas para el ALB"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Lista de subnets privadas para las tareas Fargate"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security Group para el ALB"
  type        = string
}

variable "ecs_security_group_id" {
  description = "Security Group para las tareas Fargate"
  type        = string
}

variable "aws_region" {
  description = "Región AWS donde se crea el ALB y CloudWatch Logs"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ARN del certificado ACM para el listener HTTPS del ALB"
  type        = string
  default     = ""     # Deja vacío si vas a usar HTTP primero
}
