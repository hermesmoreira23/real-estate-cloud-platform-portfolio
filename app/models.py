# app/models.py

from db_config import Base  # Clase base para definir modelos ORM
from sqlalchemy import Column, Integer, String  # Tipos de columna comunes


# Definición del modelo Property para la tabla 'properties'
class Property(Base):
    __tablename__ = "properties"  # Nombre de la tabla en PostgreSQL
    id = Column(
        Integer, primary_key=True, index=True
    )  # Clave primaria autoincremental y con índice para búsquedas eficientes
    name = Column(
        String, index=True
    )  # Nombre de la propiedad, útil para buscar por palabra
    location = Column(
        String
    )  # Campo de texto para indicar ubicación (ciudad, barrio, etc.)
    price = Column(Integer)  # Precio de la propiedad


# Exportar explícitamente clases para importaciones limpias
__all__ = ["Property", "Base"]
