# Usa una imagen base ligera de Python 3.10
FROM python:3.10-slim 
# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el archivo de dependencias al contenedor
COPY requirements.txt .

# Copia todo el código de la carpeta app al contenedor
COPY app/ .
# Copia el script wait-for-it para controlar la conexión a la base de datos
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh
# Instala las dependencias sin cache para reducir tamaño
RUN pip install --no-cache-dir -r requirements.txt
# Comando por defecto: espera a que Postgres esté listo y luego arranca Uvicorn
CMD ["/wait-for-it.sh", "db:5432", "--", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
