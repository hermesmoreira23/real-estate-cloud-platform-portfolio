variable "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  type        = list(string)
}

variable "db_security_group_id" {
  description = "Grupo de seguridad para RDS"
  type        = string
}

variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
}

variable "db_username" {
  description = "Usuario de la base de datos"
  type        = string
}

variable "db_password" {
  description = "Contraseña del usuario"
  type        = string
  sensitive   = true
}
