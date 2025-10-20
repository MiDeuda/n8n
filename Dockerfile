# 1️⃣ Base
FROM node:22-alpine

# 2️⃣ Directorio de trabajo
WORKDIR /app

# 3️⃣ Copiar todo el repo primero (necesario para workspaces)
COPY . .

# 4️⃣ Instalar pnpm global
RUN npm install -g pnpm@latest

# 5️⃣ Instalar dependencias del monorepo
RUN pnpm install --shamefully-hoist --ignore-scripts --no-frozen-lockfile

# 6️⃣ Establecer las variables de entorno
ENV DB_POSTGRESDB_DATABASE=n8n-database \
    DB_POSTGRESDB_HOST=n8n-database-ji1qxd \
    DB_POSTGRESDB_PASSWORD=7C$nP/35>Mux7Tt< \
    DB_POSTGRESDB_PORT=5432 \
    DB_POSTGRESDB_SSL=true \
    DB_POSTGRESDB_SSL_REJECT_UNAUTHORIZED=false \
    DB_POSTGRESDB_USER=postgres \
    DB_TYPE=postgresdb \
    N8N_ENCRYPTION_KEY=a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p9 \
    WEBHOOK_URL=md-n8n-v7qvmw-fd093f-34-39-134-94.traefik.me

# 7️⃣ Exponer puerto de n8n
EXPOSE 5678

# 8️⃣ Comando de inicio
CMD ["npx", "n8n"]
