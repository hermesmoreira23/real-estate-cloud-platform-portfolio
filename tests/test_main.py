import os
import sys

import pytest
from fastapi.testclient import TestClient

# Ajuste de PATH para que pytest encuentre app/main.py
sys.path.insert(
    0,
    os.path.abspath(
        os.path.join(os.path.dirname(__file__), "..", "app"),
    ),
)

from main import app  # noqa: E402

client = TestClient(app)


def test_read_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello, Real Estate Cloud!"}

    
