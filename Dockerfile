# Use a imagem base do Node.js
FROM node:20

# Defina o diretório de trabalho no contêiner
WORKDIR /app

# Copie os arquivos de dependências para o contêiner
COPY package*.json ./

# Instale as dependências do projeto
RUN npm install

# Copie o restante dos arquivos para o contêiner
COPY . .

RUN npx prisma generate

# Compile o código TypeScript para a pasta dist
RUN npm run build

# Exponha a porta 3000 para o contêiner
EXPOSE 3000

# Defina o comando para iniciar o servidor em produção
CMD ["npm", "run", "start:prod"]