module "vpc" {
  source = "./vpc"
}

module "security" {
  source = "./security"
  vpc_id = module.vpc.vpc_id
}

module "compute" {
  source            = "./compute"
  public_subnet_id  = module.vpc.public_subnet_id  # Usar el nombre exacto definido en outputs.tf
  security_group_id = module.security.security_group_id
  key_name          = var.key_name
}

