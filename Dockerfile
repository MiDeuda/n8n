FROM node:18-alpine

# Carpeta de trabajo
WORKDIR /app

# Copiar dependencias
COPY package.json package-lock.json ./
RUN npm install

# Copiar el resto del código
COPY . .

# Build de n8n
RUN npm run build

# Puerto que va a usar n8n
EXPOSE 5678

# Start n8n
CMD ["npm", "run", "start"]
