FROM node:22-alpine

WORKDIR /app

COPY package.json pnpm-lock.yaml ./

RUN npm install -g pnpm@latest

# Usar recursive install para monorepo y saltar validación de overrides
RUN pnpm recursive install --shamefully-hoist --ignore-scripts --no-frozen-lockfile

COPY . .

RUN pnpm run build

EXPOSE 5678

CMD ["pnpm", "start"]
