# Base
FROM node:22-alpine

# Directorio de trabajo
WORKDIR /app

# Copiar solo package.json y pnpm-lock.yaml primero (para usar cache)
COPY package.json pnpm-lock.yaml ./

# Instalar pnpm globalmente
RUN npm install -g pnpm

# Instalar dependencias (ignora overrides internos)
RUN pnpm install --shamefully-hoist

# Copiar el resto del código al contenedor
COPY . .

# Build de n8n
RUN pnpm run build

# Exponer puerto n8n
EXPOSE 5678

# Arrancar n8n usando las variables de entorno definidas en Dokploy
CMD ["pnpm", "run", "start:default"]
