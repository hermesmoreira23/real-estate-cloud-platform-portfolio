# ID interno del bucket:
# - Se puede usar para asociar políticas o integrarlo con otros recursos.

output "bucket_id" {
  value = aws_s3_bucket.main.id
}

# ARN completo del bucket:
# - Útil para permisos IAM o referencias cruzadas.

output "bucket_arn" {
  value = aws_s3_bucket.main.arn
}
