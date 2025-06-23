# Real Estate Cloud Platform 

Este proyecto implementa una plataforma de backend cloud para una aplicación inmobiliaria, utilizando arquitectura en AWS, contenedores Docker, infraestructura como código (Terraform) y despliegue automatizado (CI/CD con GitHub Actions).

---

## 🔧 Tecnologías utilizadas

- **AWS**: ECS Fargate, RDS PostgreSQL, S3, IAM, ALB, CloudWatch
- **Terraform**: Infraestructura como código modular (red, seguridad, base de datos, almacenamiento, ECS, monitoreo)
- **Docker**: Contenedor FastAPI + PostgreSQL local
- **CI/CD**: GitHub Actions (build, test, push a ECR, despliegue automático)
- **Observabilidad**: CloudWatch Logs, métricas y alarmas

---

## 📂 Estructura del proyecto

real-estate-cloud-platform/
├── app/ # Backend FastAPI
├── terraform/ # Infraestructura AWS modular
│ ├── compute/
│ ├── database/
│ ├── monitoring/
│ ├── networking/
│ ├── security/
│ ├── storage/
│ ├── dev.tfvars # Variables para entorno dev
│ └── main.tf, variables.tf, outputs.tf
├── .github/workflows/ # CI/CD (Docker, Terraform, Tests)
└── docker-compose.yml



---

## 🚀 Funcionalidades implementadas

✅ VPC con subredes públicas y privadas  
✅ Instancia RDS PostgreSQL en subnet privada  
✅ Cluster ECS Fargate + ALB HTTPS + certificado ACM  
✅ Imagen FastAPI Dockerizada  
✅ CI/CD con GitHub Actions (test, build, push, plan Terraform)  
✅ CloudWatch Logs y dashboard para monitoreo  
✅ IAM Role + SG con mínimo privilegio  
✅ Alarma de CPU en EC2  
✅ Bucket S3 con bloqueo de acceso público y versioning  
✅ Uso de workspace `dev`  
✅ Gestión sensible vía `terraform.tfvars` (sin credenciales hardcodeadas)

---

## ⚙️ Comandos útiles

```bash
# Inicializar Terraform
terraform init

# Crear o seleccionar workspace
terraform workspace select dev || terraform workspace new dev

# Planificar infraestructura
terraform plan -var-file="dev.tfvars"

# Aplicar infraestructura (solo si estás listo)
terraform apply -var-file="dev.tfvars"


CI/CD
GitHub Actions:

Validación de código (black, flake8)

Tests unitarios con pytest

Build & push Docker a Amazon ECR

Despliegue de infra con Terraform init + plan

Actualización de servicio ECS (próximamente)

🔐 Seguridad
MFA habilitado en AWS

Subredes privadas para recursos sensibles (RDS, ECS)

Roles IAM con mínimo privilegio

Almacenamiento de secretos planeado con AWS Secrets Manager

📈 Observabilidad
Logs en CloudWatch

Alarma CPU EC2

Dashboard ECS por entorno

Etiquetas project_tag y environment

Alerta de costes con AWS Budgets (pendiente de aplicar)

🧭 Próximos pasos
 Despliegue automático tras push a main

 Listener HTTPS con DNS vía Route 53

 Parameter Store / Secrets Manager para gestionar secretos

 Alertas de costes y dashboards avanzados

👤 Autor
Hermes Moreira — Arquitecto y especialista en Cloud & Big Data
Proyecto personal como portfolio para roles en arquitectura cloud.
