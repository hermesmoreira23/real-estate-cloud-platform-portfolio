# Bucket principal de S3:
# - Se nombra con el valor de la variable bucket_name.
# - Se etiqueta con el nombre del proyecto y el entorno.

resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Project     = var.project_tag
    Environment = var.environment
  }
}

# Versionado activado:
# - Permite mantener el historial de versiones de los objetos.

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.main.id
  versioning_configuration {
    status = "Enabled"
  }
}


# Reglas de seguridad:
# - Bloquea completamente el acceso público al bucket.
resource "aws_s3_bucket_public_access_block" "block" {
  bucket                  = aws_s3_bucket.main.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
