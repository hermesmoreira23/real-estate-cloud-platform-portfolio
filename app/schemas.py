# app/schemas.py

from pydantic import BaseModel              # Importa la base para definición de esquemas de validación

# Esquema base para propiedades
# - Define los campos comunes que toda propiedad debe tener
class PropertyBase(BaseModel):
    name: str                               # Nombre de la propiedad
    location: str                           # Ubicación (ciudad, barrio, etc.)
    price: int                              # Precio numérico de la propiedad

# Esquema para crear una nueva propiedad
# - Hereda de PropertyBase y no añade campos adicionales
class PropertyCreate(PropertyBase):
    pass

# Esquema completo con ID para respuestas desde la API
# - Incluye propiedades de PropertyBase más el ID generado
class Property(PropertyBase):
    id: int

    class Config:
        orm_mode = True
# Permite que Pydantic lea directamente de los modelos ORM (SQLAlchemy)