module "ecs" {
  source               = "./compute/ecs"

  cluster_name         = var.cluster_name
  service_name         = var.service_name
  container_image      = "${var.aws_account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/real-estate-app:${var.image_tag}"
  container_port       = var.container_port
  desired_count        = var.desired_count

  vpc_id               = module.networking.vpc_id
  public_subnet_ids    = [ module.networking.public_subnet_id ]
  private_subnet_ids   = module.networking.private_subnet_ids

  alb_security_group_id = var.alb_security_group_id
  ecs_security_group_id = var.ecs_security_group_id

  aws_region           = var.aws_region
  acm_certificate_arn  = var.acm_certificate_arn
}
