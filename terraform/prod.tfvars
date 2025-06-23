aws_region       = "eu-west-1"
aws_account_id   = "123456789012"

vpc_cidr_block        = "10.0.0.0/16"
public_subnet_cidr    = "10.0.1.0/24"
private_subnet_cidr   = "10.0.2.0/24"
availability_zone     = "eu-west-1a"
vpc_name              = "real-estate-vpc-prod"
subnet_name           = "real-estate-subnet-prod"
my_ip_cidr            = "79.117.198.67/32"

db_username           = "realestate"
db_password           = "SuperSecurePasswordProd1"
db_name               = "realestatedb"
db_instance_class     = "db.t3.micro"
db_allocated_storage  = 20
db_engine_version     = "15.4"

key_name              = "prod-ssh-key"
ec2_role_name         = "EC2S3accessRole"
ec2_instance_id       = "prod-instance-id"

cluster_name          = "real-estate-prod-cluster"
service_name          = "real-estate-prod-service"
container_port        = 8000
desired_count         = 3
alb_security_group_id = "sg-zzzzzzzzzzzzzzzzz"
ecs_security_group_id = "sg-wwwwwwwwwwwwwwwww"
acm_certificate_arn   = "arn:aws:acm:eu-west-1:123456789012:certificate/xxxx-xxxx-xxxx"

bucket_name           = "real-estate-prod-bucket"
project_tag           = "RealEstateCloud"
environment           = "prod"
