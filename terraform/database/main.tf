# Subnet Group para RDS PostgreSQL:
# - Define las subredes privadas donde se desplegará la base de datos.

resource "aws_db_subnet_group" "postgres_subnet_group" {
  name       = "postgres-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "Postgres subnet group"
  }
}

# Instancia de base de datos PostgreSQL:
# - Versión 15.4, clase t3.micro compatible con free tier.
# - Usa el subnet group definido arriba y un SG privado.

resource "aws_db_instance" "postgres" {
  identifier              = "real-estate-db"
  engine                  = "postgres"
  engine_version          = "15.4"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.postgres_subnet_group.name
  vpc_security_group_ids  = [var.db_security_group_id]
  skip_final_snapshot     = true
  publicly_accessible     = false
  multi_az                = false

  tags = {
    Name = "real-estate-db"
  }
}
    