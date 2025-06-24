# -- AWS --
aws_region = "eu-west-1"           # Región principal de despliegue (Irlanda) 
aws_account_id = "123456789012"    # ID de cuenta de AWS (ficticio para este ejemplo)

# -- NETWORKING --
vpc_cidr_block      = "10.0.0.0/16"  # Rango de direcciones para la VPC
public_subnet_cidr  = "10.0.1.0/24"  # Subred pública para ALB y acceso externo  
private_subnet_cidr = "10.0.2.0/24"  # Subred privada para RDS y backend
availability_zone   = "eu-west-1a"   # Zona de disponibilidad usada en este entorno
vpc_name            = "free-tier-vpc"       # Nombre para identificar la VPC
subnet_name         = "free-tier-public-subnet-1"  # Nombre amigable de subred pública 
my_ip_cidr          = "79.117.198.67/32"           # IP local (para restringir SSH, por ejemplo)     

# -- RECURSOS EXISTENTES EN AWS --
vpc_id               = "vpc-0dd7819cf75ab4d05"          # VPC ya creada (reutilizada)
public_subnet_id     = "subnet-0679c9624b0odacb1"       # Subred pública ya existente
private_subnet_ids   = ["subnet-01ea7940ef4bac86b"]     # Subred privada usada por RDS/ECS
security_group_id    = "sg-0f76c4fc9a714b780"           # SG general usado por el ALB/ECS
db_security_group_id = "sg-0f76c4fc9a714b780"           # SG específico para la base de datos

# -- DATABASE / RDS --
db_name              = "realestate"                     # Nombre de la base de datos
db_username          = "admin"                          # Usuario administrador
db_password          = "SuperSecurePasswordPeludin"     # Contraseña segura (cambiar en prod)
db_instance_class    = "db.t3.micro"                    # Clase compatible con free tier
db_allocated_storage = 20                               # Tamaño en GB del almacenamiento asignado
db_engine_version    = "15.3"                           # Versión de PostgreSQL

# -- S3 / STORAGE --
bucket_name = "inmobiliaria-hermes-2025"                # Nombre único del bucket S3 (público bloqueado)

# -- ECS / FARGATE --
cluster_name          = "real-estate-cluster"           # Nombre único del bucket S3 (público bloqueado)
service_name          = "real-estate-service"           # Nombre del ECS service
container_port        = 8000                            # Puerto expuesto por el contenedor
desired_count         = 2                               # Número deseado de tareas en ejecución
alb_security_group_id = "sg-0f76c4fc9a714b780"          # SG del ALB
ecs_security_group_id = "sg-0f76c4fc9a714b780"          # SG del servicio ECS
acm_certificate_arn   = "arn:aws:acm:eu-west-1:123456789012:certificate/abcdefg-1234-5678-abcd-abcdef012345" # Certificado HTTPS
image_tag             = "latest"                        # Etiqueta de la imagen Docker a desplegar

# ==== ETIQUETADO ====
project_tag = "RealEstateCloud"             # Etiqueta general del proyecto
environment = "dev"                         # Entorno (dev, staging, prod)


# -- Variables adicionales para EC2 o monitoreo --
key_name        = "nombre-de-llave-ssh"           # Nombre del par de llaves SSH si usas EC2
ec2_role_name   = "AWSServiceRoleForAutoScaling"  # Rol IAM para EC2 (si aplica)
ec2_instance_id = ""                              # ID opcional si se monitoriza una instancia EC2
