# ─────────────────────────────
# Credenciales y acceso
# ─────────────────────────────
variable "aws_region" {
  description = "Región de AWS"
  type        = string
  default     = "eu-west-1"
}

variable "aws_account_id" {
  description = "ID de la cuenta AWS"
  type        = string
}

variable "key_name" {
  description = "Nombre del par de llaves SSH para EC2"
  type        = string
}

variable "my_ip_cidr" {
  description = "Tu IP pública en formato CIDR (ej: 1.2.3.4/32)"
  type        = string
}

# ─────────────────────────────
# Base de datos (RDS PostgreSQL)
# ─────────────────────────────
variable "db_name" {
  description = "Nombre de la base de datos PostgreSQL"
  type        = string
}

variable "db_username" {
  description = "Usuario administrador de la base de datos"
  type        = string
}

variable "db_password" {
  description = "Contraseña del usuario administrador"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Clase de instancia RDS (ej: db.t3.micro)"
  type        = string
}

variable "db_allocated_storage" {
  description = "Almacenamiento asignado en GB"
  type        = number
}

variable "db_engine_version" {
  description = "Versión del motor PostgreSQL"
  type        = string
}

# ─────────────────────────────
# Red y subredes (VPC)
# ─────────────────────────────
variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
}

variable "vpc_cidr_block" {
  description = "Bloque CIDR para la VPC"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "availability_zone" {
  description = "Zona de disponibilidad AWS (ej: eu-west-1a)"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR para la subnet pública"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR para la subnet privada"
  type        = string
}

variable "subnet_name" {
  description = "Nombre para la subnet pública"
  type        = string
}

variable "public_subnet_id" {
  description = "ID de la subnet pública para EC2"
  type        = string
}

variable "private_subnet_ids" {
  description = "Lista de IDs de subredes privadas"
  type        = list(string)
}

# ─────────────────────────────
# Seguridad (Security Groups e IAM)
# ─────────────────────────────
variable "security_group_id" {
  description = "ID del Security Group para EC2"
  type        = string
}

variable "db_security_group_id" {
  description = "ID del Security Group para RDS"
  type        = string
}

variable "alb_security_group_id" {
  description = "ID del Security Group para ALB"
  type        = string
}

variable "ecs_security_group_id" {
  description = "ID del Security Group para tareas ECS"
  type        = string
}

variable "ec2_role_name" {
  description = "Nombre del rol IAM para EC2"
  type        = string
}

# ─────────────────────────────
# EC2 y Monitoreo
# ─────────────────────────────
variable "ec2_instance_id" {
  description = "ID de la instancia EC2 para alarmas"
  type        = string
}

# ─────────────────────────────
# 🪣 Almacenamiento
# ─────────────────────────────
variable "bucket_name" {
  description = "Nombre único para el bucket S3"
  type        = string
}

# ─────────────────────────────
# ECS y despliegue de contenedores
# ─────────────────────────────
variable "cluster_name" {
  description = "Nombre del ECS Cluster"
  type        = string
}

variable "service_name" {
  description = "Nombre del servicio ECS"
  type        = string
}

variable "container_port" {
  description = "Puerto expuesto por el contenedor"
  type        = number
}

variable "desired_count" {
  description = "Número de tareas Fargate deseadas"
  type        = number
}

variable "image_tag" {
  description = "Tag de la imagen Docker (ej: latest, commit SHA)"
  type        = string
  default     = "latest"
}

variable "acm_certificate_arn" {
  description = "ARN del certificado SSL (ACM) para HTTPS en ALB"
  type        = string
  default     = ""
}

# ─────────────────────────────
# Etiquetas generales
# ─────────────────────────────
variable "project_tag" {
  description = "Etiqueta del proyecto (usada en tags)"
  type        = string
}

variable "environment" {
  description = "Entorno del despliegue (dev, staging, prod)"
  type        = string
}
