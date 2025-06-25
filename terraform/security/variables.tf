# ID de la VPC:
# - Necesario para asociar los Security Groups y los recursos IAM a la red adecuada.

variable "vpc_id" {
  description = "VPC ID to associate with the security group"
  type        = string
}

# Mi IP personal en formato CIDR:
# - Se usa para restringir el acceso SSH únicamente a mi máquina local

variable "my_ip_cidr" {
  description = "79.117.198.67"
  type        = string
}
