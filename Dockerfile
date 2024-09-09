# Usar la imagen base de Ubuntu 24.02
FROM ubuntu:24.02

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Actualizar el sistema e instalar curl
RUN apt update && apt install -y curl

# Instalar Node.js 18.x
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt install -y nodejs

# Verificar la instalación de Node.js y npm
RUN node -v && npm -v

# Copiar el package.json y el package-lock.json
COPY package*.json ./

# Instalar las dependencias del proyecto
RUN npm install

# Copiar todo el código de la aplicación al contenedor
COPY . .

# Exponer el puerto 5000 (puerto donde la app escuchará dentro del contenedor)
EXPOSE 5000

# Comando para ejecutar la aplicación
CMD ["node", "app.js"]
