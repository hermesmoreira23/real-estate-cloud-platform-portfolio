from fastapi import Depends, FastAPI                            # Importa FastAPI y dependencias para inyección automática
from fastapi.middleware.cors import CORSMiddleware              # Middleware para controlar CORS y permitir orígenes externos
from sqlalchemy import text                                     # Para ejecutar comandos SQL directos en la base de datos
from sqlalchemy.orm import Session                              # Definición del tipo de sesión

from db_config import SessionLocal                              # Instanciación de sesión conectada a PostgreSQL

import crud                                                     # Lógica de acceso y manipulación de datos    
import schemas                                                  # Definiciones de esquemas Pydantic para validación

# Crea la aplicación FastAPI
# - Aquí se definen rutas, middlewares y dependencias
app = FastAPI()

# Configuración CORS
# - Permite peticiones de cualquier origen; útil en desarrollo
# - En producción, restringir `allow_origins` a URLs específicas
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

    #Proveedor de sesión de base de datos por solicitud:
    #- Abre una sesión SQLAlchemy
    #- La entrega mediante `yield` a cada endpoint
    #- Garantiza cierre de sesión al terminar o en error
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

    #Endpoint raíz para verificación de salud:
    #- Devuelve un mensaje simple para saber que la API está activa
@app.get("/")
def read_root():
    return {"message": "Hello, Real Estate Cloud!"}

    # Endpoint para comprobar estado de base de datos:
    #- Ejecuta SELECT 1 para test de conexión
    #- Devuelve éxito o detalle del error en JSON
@app.get("/db-check")
def db_check(db: Session = Depends(get_db)):
    try:
        db.execute(text("SELECT 1"))
        return {"db_status": "Conexión exitosa a PostgreSQL"}
    except Exception as e:
        return {"db_status": "Error de conexión", "error": str(e)}

    #Crea una nueva propiedad inmobiliaria:
    #- Valida entrada con PropertyCreate
    #- Inserta dato usando capa CRUD
    #- Devuelve el objeto creado con ID
@app.post("/properties/")
def create_property(property: schemas.PropertyCreate, db: Session = Depends(get_db)):
    return crud.create_property(db=db, property=property)

    #Lista propiedades existentes:
    #- Permite paginación con `skip` y `limit`
    #- Usa capa CRUD para recuperar datos
    #- Devuelve un listado paginado
@app.get("/properties/")
def read_properties(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    return crud.get_properties(db, skip=skip, limit=limit)

# Exporta explícitamente `app` para que Uvicorn la detecte
__all__ = ["app"]
