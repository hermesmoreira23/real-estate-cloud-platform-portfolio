variable "key_name" {
  description = "SSH key name to access EC2"
  type        = string
}
variable "db_username" {
  description = "Nombre de usuario para la base de datos PostgreSQL"
  type        = string
}

variable "my_ip_cidr" {
  description = "Tu IP pública con notación CIDR para acceso SSH"
  type        = string
}

variable "db_name" {
  description = "Nombre de la base de datos PostgreSQL"
  type        = string
}

variable "db_password" {
  description = "Contraseña del usuario administrador de la base de datos"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Tipo de instancia de la base de datos"
  type        = string
}

variable "db_allocated_storage" {
  description = "Espacio de almacenamiento en GB"
  type        = number
}

variable "db_engine_version" {
  description = "Versión del motor PostgreSQL"
  type        = string
}

variable "vpc_name" {
  description = "Nombre para la VPC"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block para la VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block para la subnet pública"
  type        = string
}

variable "availability_zone" {
  description = "Zona de disponibilidad para la subnet"
  type        = string
}

variable "subnet_name" {
  description = "Nombre de la subnet pública"
  type        = string
}