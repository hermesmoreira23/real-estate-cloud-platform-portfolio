variable "bucket_name" {
  description = "Nombre único para el bucket S3"
  type        = string
}

variable "project_tag" {
  description = "Tag del proyecto"
  type        = string
  default     = "RealEstateCloud"
}

variable "environment" {
  description = "Entorno (dev, prod, etc.)"
  type        = string
  default     = "dev"
}
