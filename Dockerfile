FROM node:22-alpine

WORKDIR /app

# Copiar archivos de dependencias
COPY package.json pnpm-lock.yaml ./

# Instalar pnpm globalmente
RUN npm install -g pnpm

# Instalar dependencias
RUN pnpm install --frozen-lockfile

# Copiar el resto del repo
COPY . .

# Build de n8n
RUN pnpm run build

# Exponer puerto
EXPOSE 5678

# Start n8n
CMD ["pnpm", "run", "start:default"]
