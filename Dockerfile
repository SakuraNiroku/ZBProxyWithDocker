FROM python:3.9-slim
WORKDIR /app
COPY . .
RUN pip install putils gunicorn flask && chmod +x zbproxy
CMD ["gunicorn", "app:app"]