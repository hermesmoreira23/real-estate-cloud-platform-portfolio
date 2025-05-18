variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability Zone for the public subnet"
  type        = string
  default     = "eu-west-1a"
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
  default     = "free-tier-vpc"
}

variable "subnet_name" {
  description = "Name tag for the public subnet"
  type        = string
  default     = "free-tier-public-subnet-1"
}

variable "private_subnet_cidr" {
  description = "CIDR para la subred privada"
  type        = string
}
