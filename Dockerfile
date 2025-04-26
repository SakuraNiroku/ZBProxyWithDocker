FROM python:3.9-slim
WORKDIR /app
COPY . .
RUN pip install psutil gunicorn flask && chmod +x zbproxy
CMD ["gunicorn", "-b 0.0.0.0:8000", "app:app"]