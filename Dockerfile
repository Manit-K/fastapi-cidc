# Dockerfile สำหรับ FastAPI + Cloud Run

FROM python:3.12-slim

# ตั้งค่าพื้นฐานของ Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# โฟลเดอร์ทำงานใน container
WORKDIR /app

# ติดตั้ง dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ก็อปโค้ดทั้งหมดเข้า image
COPY . .

# Cloud Run ใช้พอร์ต 8080
EXPOSE 8080

# รัน FastAPI ผ่าน uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
