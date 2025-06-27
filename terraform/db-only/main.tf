# Define el proveedor AWS y la región
provider "aws" {
  region = "eu-west-1"
}

# Variables de sandbox para VPC y subnets
variable "vpc_id" {
  description = "ID de VPC (sandbox ficticio)"
  default     = "vpc-12345678"
}

variable "subnet_ids" {
  description = "Lista de subnets (sandbox ficticias)"
  default     = ["subnet-1234", "subnet-5678"]
}

variable "db_password" {
  description = "Password para Postgres"
  default     = "changeme"
}

resource "aws_db_subnet_group" "pg" {
  name       = "sandbox-pg-subnet-group"
  subnet_ids = var.subnet_ids
}

# Instancia RDS PostgreSQL en Fargate sandbox
resource "aws_db_instance" "pg" {
  identifier             = "sandbox-db"
  engine                 = "postgres"
  engine_version         = "15.4"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_subnet_group_name   = aws_db_subnet_group.pg.name
  publicly_accessible    = false
  skip_final_snapshot    = true                           # Elimina automáticamente al destruir
  username               = "admin"                        # Usuario por defecto
  password               = var.db_password                # Contraseña desde variable 
  vpc_security_group_ids = []                             # Sin SG para simplificar sandbox
}
