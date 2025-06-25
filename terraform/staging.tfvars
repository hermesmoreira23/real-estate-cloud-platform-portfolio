# Parámetros generales

aws_region       = "eu-west-1"                          # Región AWS: Europa (Irlanda)
aws_account_id   = "123456789012"                       # ID de la cuenta AWS

# Red (VPC y Subredes)
vpc_cidr_block        = "10.0.0.0/16"                   # CIDR principal de la VPC
public_subnet_cidr    = "10.0.1.0/24"                   # Subred pública
private_subnet_cidr   = "10.0.2.0/24"                   # Subred privada
availability_zone     = "eu-west-1a"                    # Zona de disponibilidad
vpc_name              = "real-estate-vpc-staging"       # Nombre de la VPC
subnet_name           = "real-estate-subnet-staging"    # Nombre de la subred pública
my_ip_cidr            = "79.117.198.67/32"              # IP autorizada para acceso a EC2

# Base de datos (RDS PostgreSQL)
db_username           = "realestate_staging"            # Usuario de base de datos
db_password           = "stagingSecurePassword"         # Contraseña (sensible)
db_name               = "realestatedb_staging"          # Nombre de la base de datos    
db_instance_class     = "db.t3.micro"                   # Instancia apta para staging
db_allocated_storage  = 20                              # Almacenamiento en GB
db_engine_version     = "15.4"                          # Versión de PostgreSQL

# EC2 (acceso o debugging)
key_name              = "staging-ssh-key"               # Par de claves SSH
ec2_role_name         = "EC2S3accessRole"               # IAM Role para acceso a S3
ec2_instance_id       = "staging-instance-id"           # ID de instancia (si ya existe)

# ECS / Fargate
cluster_name          = "real-estate-staging-cluster"   # Cluster ECS
service_name          = "real-estate-staging-service"   # Servicio ECS
container_port        = 8000                            # Puerto del contenedor
desired_count         = 2                               # Tareas deseadas
alb_security_group_id = "sg-xxxxxxxxxxxxxxxxx"          # SG para ALB
ecs_security_group_id = "sg-yyyyyyyyyyyyyyyyy"          # SG para ECS
acm_certificate_arn   = "" # sin certificado staging    # Certificado vacío (usa HTTP)

bucket_name           = "real-estate-staging-bucket"    # Bucket específico para entorno staging
project_tag           = "RealEstateCloud"               # Tag común para todos los recursos
environment           = "staging"                       # Entorno de staging (pre-producción)
