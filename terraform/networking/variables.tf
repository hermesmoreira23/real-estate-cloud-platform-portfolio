# Región
variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

# CIDR block de la VPC
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# CIDR para la subred pública
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# CIDR para la subred privada
variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

# Zona de disponibilidad
variable "availability_zone" {
  description = "Availability zone to deploy subnets"
  type        = string
  default     = "eu-west-1a"
}

# Nombre de la VPC
variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
  default     = "real-estate-vpc"
}

# Nombre base para las subredes
variable "subnet_name" {
  description = "Name tag for the subnets"
  type        = string
  default     = "real-estate-subnet"
}
