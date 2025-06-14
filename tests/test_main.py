# tests/test_main.py

import os
import sys

# 1) __file__ es tests/test_main.py
# 2) dirname(__file__) → tests/
# 3) os.path.join(..., "..", "app") → ../app
# 4) abspath → ruta absoluta a tu carpeta app/
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

from fastapi.testclient import TestClient
from main import app  # ahora importa app/main.py directamente

client = TestClient(app)


def test_read_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello, Real Estate Cloud!"}
