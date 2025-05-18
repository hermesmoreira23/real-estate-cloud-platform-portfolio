variable "public_subnet_id" {
  description = "ID de la subred pública para la EC2"
  type        = string
}

variable "key_name" {
  description = "Nombre del par de claves SSH"
  type        = string
}

variable "security_group_id" {
  description = "ID del security group para EC2"
  type        = string
}
