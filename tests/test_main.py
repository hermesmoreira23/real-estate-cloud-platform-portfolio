# tests/test_main.py

import os
import sys
from fastapi.testclient import TestClient

# Add the app folder to PYTHONPATH so we can import main.py directly
sys.path.insert(
    0,
    os.path.abspath(
        os.path.join(os.path.dirname(__file__), "..", "app")
    ),
)

from main import app  # noqa: E402

client = TestClient(app)


def test_read_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello, Real Estate Cloud!"}
