# Dockerfile para Dokploy - n8n monorepo fork

# 1️⃣ Imagen base
FROM node:22-alpine

# 2️⃣ Establece directorio de trabajo
WORKDIR /app

# 3️⃣ Copiar solo package.json y lockfile
COPY package.json pnpm-lock.yaml ./

# 4️⃣ Instalar pnpm globalmente
RUN npm install -g pnpm@latest

# 5️⃣ Instalar dependencias ignorando overrides de catálogo
RUN pnpm install --shamefully-hoist --ignore-scripts --no-frozen-lockfile

# 6️⃣ Copiar el resto del código
COPY . .

# 7️⃣ Build del monorepo
RUN pnpm run build

# 8️⃣ Exponer puerto
EXPOSE 5678

# 🔟 Entry point
CMD ["node", "packages/cli/bin/n8n"]
