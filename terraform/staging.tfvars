aws_region       = "eu-west-1"
aws_account_id   = "123456789012"

vpc_cidr_block        = "10.0.0.0/16"
public_subnet_cidr    = "10.0.1.0/24"
private_subnet_cidr   = "10.0.2.0/24"
availability_zone     = "eu-west-1a"
vpc_name              = "real-estate-vpc-staging"
subnet_name           = "real-estate-subnet-staging"
my_ip_cidr            = "79.117.198.67/32"

db_username           = "realestate_staging"
db_password           = "stagingSecurePassword"
db_name               = "realestatedb_staging"
db_instance_class     = "db.t3.micro"
db_allocated_storage  = 20
db_engine_version     = "15.4"

key_name              = "staging-ssh-key"
ec2_role_name         = "EC2S3accessRole"
ec2_instance_id       = "staging-instance-id"

cluster_name          = "real-estate-staging-cluster"
service_name          = "real-estate-staging-service"
container_port        = 8000
desired_count         = 2
alb_security_group_id = "sg-xxxxxxxxxxxxxxxxx"
ecs_security_group_id = "sg-yyyyyyyyyyyyyyyyy"
acm_certificate_arn   = "" # sin certificado staging

bucket_name           = "real-estate-staging-bucket"
project_tag           = "RealEstateCloud"
environment           = "staging"
