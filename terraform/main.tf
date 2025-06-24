terraform { 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.3.0"
}

# ——— Módulo de red (VPC + subnets) ———
module "networking" {
  source              = "./networking"
  vpc_cidr_block      = var.vpc_cidr_block
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
  vpc_name            = var.vpc_name
  subnet_name         = var.subnet_name
}

# ——— Módulo de seguridad (SGs, IAM, etc.) ———
module "security" {
  source     = "./security"
  vpc_id     = module.networking.vpc_id
  my_ip_cidr = var.my_ip_cidr
}

# ——— Módulo de base de datos RDS ———
module "database" {
  source               = "./database"
  private_subnet_ids   = module.networking.private_subnet_ids
  db_security_group_id = module.security.db_security_group_id
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
}

# ——— Random para sufijo de bucket ———
resource "random_string" "suffix" {
  length  = 6
  special = false
}

# ——— Módulo de almacenamiento S3 ———
module "storage" {
  source      = "./storage"
  bucket_name = "real-estate-static-bucket-${random_string.suffix.result}"
  project_tag = var.project_tag
  environment = var.environment
}

# ——— Proveedor AWS ———
provider "aws" {
  region = var.aws_region
}

# ——— Exportar endpoint de RDS ———
output "rds_endpoint" {
  description = "Endpoint completo exportado desde el módulo database"
  value       = module.database.db_endpoint
}

# ——— Módulo ECS / Fargate ———
module "ecs" {
  source                 = "./compute/ecs"
  cluster_name           = var.cluster_name
  service_name           = var.service_name
  container_image        = "<TU_CUENTA>.dkr.ecr.${var.aws_region}.amazonaws.com/real-estate-app:${var.image_tag}"
  container_port         = var.container_port
  desired_count          = var.desired_count
  vpc_id                 = module.networking.vpc_id
  public_subnet_ids      = [module.networking.public_subnet_id]
  private_subnet_ids     = module.networking.private_subnet_ids
  alb_security_group_id  = module.security.security_group_id
  ecs_security_group_id  = module.security.security_group_id
  acm_certificate_arn    = var.acm_certificate_arn
  aws_region             = var.aws_region
}

# Output del endpoint de la base de datos
# - Esto se usará para conectar la app al RDS PostgreSQL.
output "ecs_log_group_name" {
  description = "Nombre del grupo de logs para ECS en CloudWatch"
  value       = "/ecs/${var.cluster_name}"
}

# Módulo de monitoreo con CloudWatch
# - Incluye alarmas y dashboards para ECS y ALB
module "monitoring" {
  source          = "./monitoring"
  ec2_instance_id = var.ec2_instance_id
  cluster_name    = var.cluster_name
  alb_arn_suffix  = module.ecs.alb_arn_suffix
  aws_region      = var.aws_region
  project_tag     = var.project_tag
  environment     = var.environment
}
