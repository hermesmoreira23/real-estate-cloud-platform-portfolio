import os
import sys

# Ajuste de path para importar desde /app
sys.path.insert(
    0,
    os.path.abspath(
        os.path.join(
            os.path.dirname(__file__),
            "..",
            "app",
        )
    ),
)

from fastapi.testclient import TestClient
from main import app  # importa directamente app/main.py

client = TestClient(app)

def test_read_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello, Real Estate Cloud!"}
