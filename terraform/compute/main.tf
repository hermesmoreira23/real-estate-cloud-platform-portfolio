resource "aws_instance" "web" {
  ami                    = "ami-0c1c30571d2dae5c9" # Amazon Linux 2 - eu-west-1
  instance_type          = "t2.micro"
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name
  iam_instance_profile   = aws_iam_instance_profile.ec2_instance_profile.name  

  tags = {
    Name = "real-estate-ec2"
  }
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "EC2InstanceProfile"
  role = var.ec2_role_name
}