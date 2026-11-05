# 1. Imagen base oficial y liviana
FROM python:3.12-slim

# 2. Carpeta de trabajo dentro del contenedor
WORKDIR /app

# 3. Copiar requirements y dependencias sin caché
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copiar solo las carpetas necesarias
COPY app/ app/
COPY frontend/ frontend/
COPY models/ models/

# 5. Exponer el puerto
EXPOSE 8000

# 6. Comando de arranque
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]