# Parámetros generales

aws_region       = "eu-west-1"                          # Región de despliegue (Irlanda)
aws_account_id   = "123456789012"                       # ID de la cuenta AWS

# Red (VPC y Subredes)
vpc_cidr_block        = "10.0.0.0/16"                   # Rango CIDR para la VPC
public_subnet_cidr    = "10.0.1.0/24"                   # Subred públic
private_subnet_cidr   = "10.0.2.0/24"                   # Subred privada
availability_zone     = "eu-west-1a"                    # Zona de disponibilidad
vpc_name              = "real-estate-vpc-prod"          # Nombre de la VPC
subnet_name           = "real-estate-subnet-prod"       # Nombre de la subred pública
my_ip_cidr            = "79.117.198.67/32"              # IP para acceso restringido a EC2

# Base de datos (RDS PostgreSQL)
db_username           = "realestate"                    # Usuario administrador de BBDD
db_password           = "SuperSecurePasswordProd1"      # Contraseña (debe ir en Secrets Manager)
db_name               = "realestatedb"                  # Nombre de la base de datos
db_instance_class     = "db.t3.micro"                   # Tipo de instancia
db_allocated_storage  = 20                              # Tamaño en GB
db_engine_version     = "15.4"                          # Versión de PostgreSQL

# EC2 - Acceso administrativo o puente
key_name              = "prod-ssh-key"                  # Par de claves para acceder por SSH
ec2_role_name         = "EC2S3accessRole"               # Nombre del IAM Role
ec2_instance_id       = "prod-instance-id"              # ID de la instancia EC2 ya provisionada

cluster_name          = "real-estate-prod-cluster"      # ECS Cluster para producción
service_name          = "real-estate-prod-service"      # Servicio ECS asociado
container_port        = 8000                            # Puerto expuesto por el contenedor
desired_count         = 3                               # Nº de tareas Fargate deseadas
alb_security_group_id = "sg-zzzzzzzzzzzzzzzzz"          # Security Group para ALB
ecs_security_group_id = "sg-wwwwwwwwwwwwwwwww"          # Security Group para ECS
acm_certificate_arn   = "arn:aws:acm:eu-west-1:123456789012:certificate/xxxx-xxxx-xxxx"         # Certificado HTTPS para listener

# Almacenamiento estático (S3)
bucket_name           = "real-estate-prod-bucket"       # Bucket para archivos estáticos del frontend u otros objetos
project_tag           = "RealEstateCloud"               # Tag común para identificar recursos
environment           = "prod"                          # Nombre del entorno (producción)
