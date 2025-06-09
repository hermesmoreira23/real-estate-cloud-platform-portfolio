FROM python:3.10-slim 
WORKDIR /app

# Copia los requirements desde la raíz all
COPY requirements.txt .

# Copia toda la carpeta app dentro de /app
COPY app/ .

COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

RUN pip install --no-cache-dir -r requirements.txt

CMD ["/wait-for-it.sh", "db:5432", "--", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
