module "vpc" {
  source              = "./vpc"
  vpc_cidr_block      = var.vpc_cidr_block
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
  vpc_name            = var.vpc_name
  subnet_name         = var.subnet_name
}

module "security" {
  source      = "./security"
  vpc_id      = module.vpc.vpc_id
  my_ip_cidr  = var.my_ip_cidr
}

module "compute" {
  source             = "./compute"
  public_subnet_id   = module.vpc.public_subnet_id
  security_group_id  = module.security.security_group_id
  key_name           = var.key_name
  ec2_role_name      = module.security.ec2_role_name
}

module "database" {
  source               = "./database"
  private_subnet_ids   = [module.vpc.private_subnet_id]
  db_security_group_id = module.security.db_security_group_id
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
}

resource "random_string" "suffix" {
  length  = 6
  special = false
}

module "storage" {
  source      = "./storage"
  bucket_name = "real-estate-static-bucket-${random_string.suffix.result}"
  project_tag = "RealEstateCloud"
  environment = "dev"
}

module "monitoring" {
  source          = "./monitoring"
  ec2_instance_id = module.compute.web_instance_id  # o el nombre real de tu output
}
