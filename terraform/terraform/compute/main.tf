resource "aws_instance" "web" {
  ami                    = "ami-0c1c30571d2dae5c9" # Amazon Linux 2 - eu-west-1
  instance_type          = "t2.micro"
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  tags = {
    Name = "real-estate-ec2"
  }
}
