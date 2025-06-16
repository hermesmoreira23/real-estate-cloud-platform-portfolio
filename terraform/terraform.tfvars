# ==== AWS ====
aws_region = "eu-west-1"
aws_account_id = "123456789012"

# ==== NETWORKING ====
vpc_cidr_block      = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"
availability_zone   = "eu-west-1a"
vpc_name            = "free-tier-vpc"
subnet_name         = "free-tier-public-subnet-1"
my_ip_cidr          = "79.117.198.67/32"

# ==== RECURSOS EXISTENTES EN AWS ====
vpc_id               = "vpc-0dd7819cf75ab4d05"
public_subnet_id     = "subnet-0679c9624b0odacb1"
private_subnet_ids   = ["subnet-01ea7940ef4bac86b"]
security_group_id    = "sg-0f76c4fc9a714b780"
db_security_group_id = "sg-0f76c4fc9a714b780"

# ==== DATABASE / RDS ====
db_name              = "realestate"
db_username          = "admin"
db_password          = "SuperSecurePasswordPeludin"
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
db_engine_version    = "15.3"

# ==== S3 / STORAGE ====
bucket_name = "inmobiliaria-hermes-2025"

# ==== ECS / FARGATE ====
cluster_name          = "real-estate-cluster"
service_name          = "real-estate-service"
container_port        = 8000
desired_count         = 2
alb_security_group_id = "sg-0f76c4fc9a714b780"
ecs_security_group_id = "sg-0f76c4fc9a714b780"
acm_certificate_arn   = "arn:aws:acm:eu-west-1:123456789012:certificate/abcdefg-1234-5678-abcd-abcdef012345"
image_tag             = "latest"

# ==== ETIQUETADO ====
project_tag = "RealEstateCloud"
environment = "dev"

# ← Aquí debes añadir estas:
key_name        = "tu-nombre-de-llave-ssh"
ec2_role_name   = "AWSServiceRoleForAutoScaling"  # o el rol que uses
ec2_instance_id = ""                              # si no monitorizas EC2, déjalo vacío
