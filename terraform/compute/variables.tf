# Variables del módulo compute
# Estas variables permiten personalizar la creación de una instancia EC2
# asociada a subred, grupo de seguridad, clave SSH y rol IAM.


# ID de la subred pública donde se lanzará la instancia EC2.
# Es importante que esta subred tenga acceso a Internet si se espera conectarse por SSH.
variable "public_subnet_id" {
  description = "ID de la subred pública para la EC2"
  type        = string
}

# Nombre del par de claves SSH que se utilizará para acceder a la instancia EC2.
# Debe existir previamente en la cuenta de AWS.
variable "key_name" {
  description = "Nombre del par de claves SSH"
  type        = string
}

# ID del grupo de seguridad que se aplicará a la instancia EC2.
# Generalmente este grupo habilita el acceso SSH (puerto 22) desde una IP específica.
variable "security_group_id" {
  description = "ID del security group para EC2"
  type        = string
}

# Nombre del rol IAM que se asociará a la instancia EC2.
# Este rol puede otorgar permisos para acceder a servicios como S3, CloudWatch, etc.
variable "ec2_role_name" {
  description = "IAM Role name para la instancia EC2"
  type        = string
}
