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

# CIDR de la subred pública, donde residirá el ALB u otros servicios expuestos
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# CIDR de la subred privada, para recursos internos como RDS o backend
variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

# Zona de disponibilidad específica donde se desplegarán las subredes
variable "availability_zone" {
  description = "Availability zone to deploy subnets"
  type        = string
  default     = "eu-west-1a"
}

# Nombre con el que se etiquetará la VPC
variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
  default     = "real-estate-vpc"
}

# Prefijo base que se utilizará para nombrar las subredes
variable "subnet_name" {
  description = "Name tag for the subnets"
  type        = string
  default     = "real-estate-subnet"
}
