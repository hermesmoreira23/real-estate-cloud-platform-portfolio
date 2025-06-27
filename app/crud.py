# app/crud.py
from sqlalchemy.orm import Session  # Tipo para las sesiones de base de datos

import models  # Modelos ORM definidos en app/models.py
import schemas  # Esquemas de validación Pydantic definidos en app/schemas.py


# Inserta una nueva propiedad en la base de datos:
# - Crea instancia del modelo Property usando los datos validados.
# - Inserta el registro en la sesión DB.
# - Confirma cambios con commit.
# -Refresca instancia para incluir datos generados (e.g. ID).
# - Retorna objeto completo.
def create_property(db: Session, property: schemas.PropertyCreate):
    db_property = models.Property(**property.dict())
    db.add(db_property)
    db.commit()
    db.refresh(db_property)
    return db_property


# Consulta propiedades existentes con paginación:
# - Offset para saltar un número inicial de registros.
# - Limit para acotar la cantidad de resultados.
# - Devuelve lista de objetos Property.
def get_properties(db: Session, skip: int = 0, limit: int = 10):
    return db.query(models.Property).offset(skip).limit(limit).all()
