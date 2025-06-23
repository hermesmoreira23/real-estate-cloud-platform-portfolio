aws_region             = "eu-west-1"
project_tag            = "RealEstateCloud"
environment            = "dev"

vpc_name               = "free-tier-vpc"
vpc_cidr_block         = "10.0.0.0/16"
public_subnet_cidr     = "10.0.1.0/24"
private_subnet_cidr    = "10.0.2.0/24"
availability_zone      = "eu-west-1a"
subnet_name            = "free-tier-public-subnet-1"

public_subnet_id       = "subnet-12345678"
private_subnet_ids     = ["subnet-87654321"]
security_group_id      = "sg-12345678"
db_security_group_id   = "sg-87654321"

key_name               = "realestate-key"
ec2_role_name          = "ec2-s3-role"
ec2_instance_id        = "i-1234567890abcdef0"
my_ip_cidr             = "1.2.3.4/32"

db_name                = "realestate"
db_username            = "admin"
db_password            = "realhermes88"
db_instance_class      = "db.t3.micro"
db_allocated_storage   = 20
db_engine_version      = "15.4"

bucket_name            = "real-estate-static-bucket"
image_tag              = "latest"
aws_account_id         = "123456789012"

cluster_name           = "real-estate-cluster"
service_name           = "real-estate-service"
container_port         = 8000
desired_count          = 1

alb_security_group_id  = "sg-12345678"
ecs_security_group_id  = "sg-12345678"
acm_certificate_arn    = "arn:aws:acm:eu-west-1:123456789012:certificate/xxxxxx"
