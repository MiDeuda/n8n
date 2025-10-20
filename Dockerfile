# 1️⃣ Base image
FROM node:22-alpine

# 2️⃣ Directorio de trabajo
WORKDIR /app

# 3️⃣ Copiar solo archivos necesarios para instalar dependencias
COPY package.json pnpm-lock.yaml ./

# 4️⃣ Instalar pnpm globalmente
RUN npm install -g pnpm@latest

# 5️⃣ Instalar dependencias del monorepo
#    Ignora scripts, no bloquea lockfile, y hace hoisting
RUN pnpm recursive install --shamefully-hoist --ignore-scripts --no-frozen-lockfile

# 6️⃣ Copiar todo el código
COPY . .

# 7️⃣ Comando por defecto
#    Este comando usa las variables de entorno que Dokploy te provee
CMD ["pnpm", "start"]
