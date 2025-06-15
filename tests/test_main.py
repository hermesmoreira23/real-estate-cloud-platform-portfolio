import os
import sys
import pytest
from fastapi.testclient import TestClient

# Ajustamos PATH para que pytest encuentre el paquete app
sys.path.insert(
    0,
    os.path.abspath(
        os.path.join(
            os.path.dirname(__file__),
            "..",  # sube de /tests a la raíz
            "app",  # baja a /app
        )
    ),
)

from main import app  # importa directamente app/main.py

client = TestClient(app)


def test_read_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello, Real Estate Cloud!"}

