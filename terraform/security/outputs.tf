# Exporta el ID del Security Group de EC2:
# - Este ID será utilizado en otros módulos (por ejemplo, ECS o monitoreo).

output "security_group_id" {
  value = aws_security_group.ec2_sg.id
}

# Exporta el ID del Security Group asignado a la base de datos RDS:
# - Este valor se pasará al módulo de base de datos.
output "db_security_group_id" {
  value = aws_security_group.rds_sg.id
}

# Exporta el nombre del rol IAM asignado a la instancia EC2:
# - Este nombre se puede usar para monitorización o referencia externa.
output "ec2_role_name" {
  value = aws_iam_role.ec2_role.name
}