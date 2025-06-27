# Real Estate Cloud Platform

**Real Estate Cloud Platform** es mi solución para una plataforma inmobiliaria en la nube sobre **AWS**, usando infraestructura como código con **Terraform**, backend en **FastAPI + PostgreSQL**, contenedores **Docker**, y **CI/CD con GitHub Actions**.

---

## Arquitectura y componentes

- **Infraestructura (Terraform)**:
  - `networking/`: VPC, subredes públicas/privadas, IGW y tablas de rutas.
  - `security/`: grupos de seguridad e IAM roles.
  - `database/`: RDS PostgreSQL privado.
  - `compute/ecs/`: ECS Fargate con ALB HTTPS, target group y servicio.
  - `storage/`: S3 con versionado y bloqueo de acceso público.
  - `monitoring/`: alarmas CPU para EC2 y dashboards ECS/ALB en CloudWatch.
  - `db-only/`: sandbox de base de datos PostgreSQL.
  - Archivos `*.tfvars` (`dev`, `staging`, `prod`) para multi-ambientes.

- **Backend (FastAPI)**:
  - Código en `app/`: `main.py`, `db_config.py`, `models.py`, `schemas.py`, `crud.py`.
  - Uso de SQLAlchemy, sesiones por petición y script para cargar `.env`.
  - Endpoints: `/`, `/db-check`, `/properties` (GET/POST).

- **Contenedores**:
  - `Dockerfile` en `app/` con Uvicorn y `wait-for-it.sh`.
  - `docker-compose.yml` ejecuta `app` y `db` para desarrollo local.

- **Calidad y pruebas**:
  - Dependencias en `requirements.txt`: FastAPI, SQLAlchemy, pytest, black, flake8, python-dotenv.
  - Test simple en `tests/test_main.py` usando TestClient.
  - En CI se ejecuta formateo (Black), lint (Flake8), conexión a BD y tests (Pytest).

- **CI/CD (GitHub Actions)**:
  - `terraform-ci.yml`: valida y planifica la infraestructura.
  - `ci.yml`: valida infra, build y push de Docker a ECR, instalación de dependencias, checks de calidad y tests.
  - Más adelante agregaré `ecs-deploy.yml` para despliegue automático.

---

## Desarrollo local

1. Desde la raíz del proyecto:
   ```bash
   git clone https://github.com/mi_usuario/real-estate-cloud-platform.git
   cd real-estate-cloud-platform


Estructura del repositorio

├── app/
│   ├── main.py
│   ├── db_config.py
│   ├── models.py
│   ├── schemas.py
│   └── crud.py
├── tests/
│   └── test_main.py
├── terraform/
│   ├── networking/
│   ├── security/
│   ├── database/
│   ├── compute/ecs/
│   ├── storage/
│   ├── monitoring/
│   ├── db-only/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── dev.tfvars
│   ├── staging.tfvars
│   └── prod.tfvars
├── .github/workflows/
│   ├── ci.yml
│   └── terraform-ci.yml
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
└── README.md

Buenas prácticas que aplico:

Estado remoto en Terraform: idealmente utilizaré backend S3 + DynamoDB para bloqueo y estado compartido.

Gestión de secretos: uso de .env en desarrollo; en producción migraré a AWS Secrets Manager o GitHub Secrets.

Estilo y calidad de código: siempre ejecuto terraform fmt, black, flake8 en pipelines o pre-commits.

Etiquetado consistente: aplico tags Project y Environment en recursos para facilitar auditoría y gestión de costos.

Modularización clara: cada módulo es independiente y expone outputs para integración entre ellos.

Entornos aislados: uso de tfvars y workspaces (dev, staging, prod) para separar ambientes.

CI ordenado y limpio: jobs encadenados (infra → build → test), sin aplicar automáticamente en prod sin revisión.

Pruebas en CI: validaciones en PR, terraform plan, pytest y comprobación de conexión a base.