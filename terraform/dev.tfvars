# Parámetros generales del entorno

aws_region             = "eu-west-1"                    # Región AWS (Irlanda)
project_tag            = "RealEstateCloud"              # Tag común para etiquetar recursos
environment            = "dev"                          # Nombre del entorno (desarrollo)

vpc_name               = "free-tier-vpc"                # Nombre de la VPC
vpc_cidr_block         = "10.0.0.0/16"                  # Rango CIDR de la VPC
public_subnet_cidr     = "10.0.1.0/24"                  # CIDR para la subred pública
private_subnet_cidr    = "10.0.2.0/24"                  # CIDR para la subred privada
availability_zone      = "eu-west-1a"                   # Zona de disponibilidad
subnet_name            = "free-tier-public-subnet-1"    # Nombre de la subred pública

# Identificadores de recursos existentes
public_subnet_id       = "subnet-12345678"              # Subred pública existente
private_subnet_ids     = ["subnet-87654321"]            # Lista de subredes privadas
security_group_id      = "sg-12345678"                  # SG para EC2
db_security_group_id   = "sg-87654321"                  # SG para RDS

# Parámetros para EC2
key_name               = "realestate-key"               # Nombre del par de claves SSH
ec2_role_name          = "ec2-s3-role"                  # IAM Role de EC2
ec2_instance_id        = "i-1234567890abcdef0"          # ID de instancia EC2 existente
my_ip_cidr             = "1.2.3.4/32"                   # IP personal para restringir acceso

# Base de datos (RDS PostgreSQL)
db_name                = "realestate"                   # Nombre de la base de datos
db_username            = "admin"                        # Usuario de la BBDD
db_password            = "realhermes88"                 # Contraseña ( sensible, se recomienda usar Secrets Manager)
db_instance_class      = "db.t3.micro"                  # Tipo de instancia (Free Tier)
db_allocated_storage   = 20                             # Almacenamiento en GB
db_engine_version      = "15.4"                         # Versión del motor PostgreSQL

# Almacenamiento (S3)
bucket_name            = "real-estate-static-bucket"    # Nombre único del bucket
# Contenedor Docker / ECR / ECS
image_tag              = "latest"                       # Etiqueta de la imagen Docker
aws_account_id         = "123456789012"                 # ID de la cuenta AWS

# ECS y Fargate
cluster_name           = "real-estate-cluster"          # Nombre del ECS Cluster
service_name           = "real-estate-service"          # Nombre del servicio ECS
container_port         = 8000                           # Puerto expuesto por el contenedor
desired_count          = 1                              # Número de tareas deseadas

alb_security_group_id  = "sg-12345678"                  # SG para el Load Balancer
ecs_security_group_id  = "sg-12345678"                  # SG para tareas ECS
acm_certificate_arn    = "arn:aws:acm:eu-west-1:123456789012:certificate/xxxxxx"            # Certificado HTTPS
