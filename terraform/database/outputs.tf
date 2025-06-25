# Endpoint del RDS PostgreSQL:
# - Es la URL de conexión a la base de datos (host:port).

# Nombre de la base de datos:
# - Útil para configurar el backend.
output "db_endpoint" {
  description = "Endpoint del RDS PostgreSQL"
  value       = aws_db_instance.postgres.endpoint
}

# Nombre de usuario administrador:
# - Puede ser necesario para conexión desde la aplicación.
output "db_name" {
  value = aws_db_instance.postgres.db_name
}

output "db_username" {
  value = aws_db_instance.postgres.username
}
