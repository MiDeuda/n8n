# 1️⃣ Imagen base
FROM node:22-alpine

# 2️⃣ Directorio de trabajo
WORKDIR /app

# 3️⃣ Copiar solo lockfile y package.json primero para cachear instalación
COPY package.json pnpm-lock.yaml ./

# 4️⃣ Instalar pnpm globalmente
RUN npm install -g pnpm@latest

# 5️⃣ Instalar dependencias sin fallar por overrides
RUN pnpm install --shamefully-hoist --ignore-scripts --no-frozen-lockfile --ignore-workspace-root-check

# 6️⃣ Copiar todo el código
COPY . .

# 7️⃣ Construir n8n
RUN pnpm run build

# 8️⃣ Puerto expuesto
EXPOSE 5678

# 9️⃣ Comando por defecto (usa variables de entorno de Dokploy)
CMD ["pnpm", "start"]
