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

# 6️⃣ Exponer puerto de n8n
EXPOSE 5678

# 7️⃣ Comando de inicio
CMD ["npx", "n8n"]
