# ---- NETWORKING ----
vpc_cidr_block      = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"
availability_zone   = "eu-west-1a"
vpc_name            = "free-tier-vpc"
subnet_name         = "free-tier-public-subnet-1"
my_ip_cidr          = "79.117.198.67/32"

# ---- RECURSOS EXISTENTES EN AWS ----
vpc_id              = "vpc-0dd7819cf75ab4d05"

public_subnet_id    = "subnet-0679c9624b0odacb1"
private_subnet_ids  = ["subnet-01ea7940ef4bac86b"]

security_group_id    = "sg-0f76c4fc9a714b780"
db_security_group_id = "sg-0f76c4fc9a714b780"  # Usarás el mismo SG para EC2 y RDS por ahora

# ---- COMPUTE / EC2 ----
key_name           = "real-estate-key"
ec2_role_name      = "AWSServiceRoleForAutoScaling"  # Elige el que prefieras de tu lista, este es de ejemplo
ec2_instance_id    = ""  # Déjalo vacío o pon el ID si tienes una instancia creada

# ---- DATABASE / RDS ----
db_name              = "realestate"
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
db_engine_version    = "15.3"

# ---- S3 / STORAGE ----
bucket_name          = "inmobiliaria-hermes-2025"

# ---- GENERALES ----
project_tag          = "RealEstateCloud"
environment          = "dev"
