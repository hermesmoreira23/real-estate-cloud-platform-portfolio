# Nombre único del bucket:
# - Debe ser globalmente único en AWS.

variable "bucket_name" {
  description = "Nombre único para el bucket S3"
  type        = string
}

# Etiqueta que identifica el proyecto:
# - Se usa en los tags del bucket para trazabilidad.
variable "project_tag" {
  description = "Tag del proyecto"
  type        = string
  default     = "RealEstateCloud"
}

# Nombre del entorno:
# - Útil para separar entornos como dev, staging o prod.
variable "environment" {
  description = "Entorno (dev, prod, etc.)"
  type        = string
  default     = "dev"
}
