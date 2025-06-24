# Security Group para EC2:
# - Permite acceso SSH solo desde mi IP personal.
# - Salida total habilitada (egress).

resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Allow SSH from my IP"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-ssh-sg"
  }
}

# Security Group para RDS PostgreSQL:
# - Permite conexión únicamente desde el Security Group de EC2.
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow PostgreSQL access from EC2"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    description     = "Allow PostgreSQL from EC2"
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-postgres-sg"
  }
}

# Política IAM para EC2 → acceso al bucket S3 del proyecto:
# - Permite listar el bucket y hacer Get/Put de objetos.
resource "aws_iam_policy" "ec2_s3_policy" {
  name        = "EC2S3AccessPolicy"
  description = "Permite acceso solo al bucket S3 del proyecto desde EC2"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = [
          "arn:aws:s3:::real-estate-static-bucket-*",         # Acceso al bucket (ajusta si tienes nombre fijo)
          "arn:aws:s3:::real-estate-static-bucket-*/*"        # Acceso a los objetos
        ]
      }
    ]
  })
}

# Rol IAM que asumirá la instancia EC2:
# - Permite que EC2 use la política anterior mediante sts:AssumeRole
resource "aws_iam_role" "ec2_role" {
  name = "EC2S3AccessRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# Unión del rol con la política:
# - Adjunta la política EC2S3AccessPolicy al rol EC2S3AccessRole.
resource "aws_iam_role_policy_attachment" "attach_s3_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_s3_policy.arn
}

