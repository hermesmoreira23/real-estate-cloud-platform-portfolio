# Nombre del clúster ECS donde se desplegarán las tareas Fargate
variable "cluster_name" {
  description = "Nombre del cluster ECS"
  type        = string
  default     = "real-estate-cluster"
}

# Nombre del servicio ECS, que se asociará con el clúster y la definición de tarea
variable "service_name" {
  description = "Nombre del ECS Service"
  type        = string
  default     = "real-estate-service"
}


# URI completo de la imagen Docker que se utilizará en la definición de tarea
# Normalmente esta imagen está alojada en Amazon ECR
variable "container_image" {
  description = "URI de la imagen Docker (ECR)"
  type        = string
}

# Puerto en el que el contenedor escucha internamente
# Este puerto debe coincidir con el definido en la aplicación (por ejemplo, FastAPI usa el 8000)
variable "container_port" {
  description = "Puerto en el que escucha el contenedor"
  type        = number
  default     = 8000
}

# Número deseado de tareas (instancias del contenedor) que ECS debe mantener en ejecución
variable "desired_count" {
  description = "Número de tareas Fargate deseadas"
  type        = number
  default     = 2
}

# ID de la VPC donde se desplegarán tanto el ALB como las tareas Fargate
variable "vpc_id" {
  description = "VPC donde desplegar ALB y Fargate"
  type        = string
}

# Lista de subredes públicas donde se colocará el Application Load Balancer
# Normalmente asociadas a una zona pública con acceso a internet
variable "public_subnet_ids" {
  description = "Lista de subnets públicas para el ALB"
  type        = list(string)
}

# Lista de subredes privadas donde se ejecutarán las tareas Fargate
# Estas subredes no tienen acceso directo desde internet
variable "private_subnet_ids" {
  description = "Lista de subnets privadas para las tareas Fargate"
  type        = list(string)
}

# ID del Security Group que se asociará al Load Balancer
# Este SG define quién puede acceder al ALB (por ejemplo, el puerto 443 abierto al mundo)
variable "alb_security_group_id" {
  description = "Security Group para el ALB"
  type        = string
}

# ID del Security Group que se asociará a las tareas ECS
# Define el tráfico permitido hacia y desde los contenedores
variable "ecs_security_group_id" {
  description = "Security Group para las tareas Fargate"
  type        = string
}

# Región de AWS donde se desplegarán los recursos (ALB, ECS, CloudWatch, etc.)
variable "aws_region" {
  description = "Región AWS donde se crea el ALB y CloudWatch Logs"
  type        = string
}

# ARN del certificado SSL de ACM para configurar HTTPS en el Load Balancer
# Si aún no se configura HTTPS, se puede dejar vacío temporalmente
variable "acm_certificate_arn" {
  description = "ARN del certificado ACM para el listener HTTPS del ALB"
  type        = string
  default     = ""     # Deja vacío si vas a usar HTTP primero
}
