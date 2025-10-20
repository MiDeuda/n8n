# 1️⃣ Base image
FROM node:22-alpine

WORKDIR /app

# 2️⃣ Copiar package.json y lockfile
COPY package.json package-lock.json* ./

# 3️⃣ Instalar dependencias con npm en lugar de pnpm
RUN npm install --legacy-peer-deps

# 4️⃣ Copiar todo el código
COPY . .

# 5️⃣ CMD default
CMD ["npm", "start"]
