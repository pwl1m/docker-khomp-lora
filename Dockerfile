# Dockerfile usando Debian
FROM debian:bullseye-slim

# Instalar Node.js e npm
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    build-essential \
    python3 \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Instalar Node-RED globalmente
RUN npm install -g --unsafe-perm node-red

# Criar usuário node-red
RUN useradd -m -u 1000 node-red

USER node-red

WORKDIR /home/node-red

EXPOSE 1880

CMD ["node-red"]