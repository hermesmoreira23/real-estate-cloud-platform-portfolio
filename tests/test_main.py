# tests/test_main.py

from fastapi.testclient import TestClient
from app.main import app   # Importa tu FastAPI desde el paquete app

client = TestClient(app)

def test_read_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello, Real Estate Cloud!"}

