FROM ubuntu:22.04
RUN apt-get update && apt-get install -y curl
WORKDIR /app
COPY . .
RUN chmod +x zbproxy && chmod +x startup.sh
CMD ["./startup.sh"]
