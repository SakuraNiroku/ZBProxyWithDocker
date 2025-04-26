FROM python:3.9-slim
WORKDIR /app
COPY . .
RUN pip install putils gunicorn && chmod +x zbproxy
CMD ["gunicorn", "-c", "gunicorn_config.py", "app:app"]