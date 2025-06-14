# app/db_config.py

from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
import os

# -------------------------------------------------------------------
# Construcción de la URL de conexión:
# - Si existe la variable de entorno DATABASE_URL, la usamos (ej. RDS).
# - En caso contrario, cae a tu configuración local de Docker Compose.
# -------------------------------------------------------------------
SQLALCHEMY_DATABASE_URL = os.getenv(
    "DATABASE_URL", "postgresql://admin:realhermes88@127.0.0.1:5432/realestate"
)

# -------------------------------------------------------------------
# Motor de SQLAlchemy
# -------------------------------------------------------------------
engine = create_engine(
    SQLALCHEMY_DATABASE_URL,
    echo=True,  # Logs SQL en consola; cambia a False si no los quieres
)

# -------------------------------------------------------------------
# Creación de sesiones
# -------------------------------------------------------------------
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# -------------------------------------------------------------------
# Base declarativa para los modelos
# -------------------------------------------------------------------
Base = declarative_base()
