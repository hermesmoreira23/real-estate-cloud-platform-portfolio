from fastapi import FastAPI, Depends
from sqlalchemy import text
from sqlalchemy.orm import Session

from db_config import SessionLocal
import crud
import schemas


app = FastAPI()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@app.get("/")
def read_root():
    return {"message": "Hello, Real Estate Cloud!"}


@app.get("/db-check")
def db_check(db: Session = Depends(get_db)):
    try:
        db.execute(text("SELECT 1"))
        return {"db_status": "Conexión exitosa a PostgreSQL"}
    except Exception as e:
        return {"db_status": "Error de conexión", "error": str(e)}


@app.post("/properties/")
def create_property(
    property: schemas.PropertyCreate, db: Session = Depends(get_db)
):
    return crud.create_property(db=db, property=property)


@app.get("/properties/")
def read_properties(
    skip: int = 0, limit: int = 10, db: Session = Depends(get_db)
):
    return crud.get_properties(db, skip=skip, limit=limit)


__all__ = ["app"]
