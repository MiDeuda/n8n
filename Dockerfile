# Dockerfile (raíz del repo)
FROM n8nio/n8n:1.72.0   # o fija la versión que prefieras

# (opcional) instalar community nodes o paquetes extras:
# USER root
# RUN npm install -g n8n-nodes-starter
# USER node

# La imagen oficial ya expone 5678 y arranca n8n
