# --- Estágio de Build (para criar os arquivos de produção do React) ---
# Usar uma imagem base oficial do Node.js (versão LTS recomendada)
FROM node:20-alpine as build

# Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar os arquivos package.json e package-lock.json (ou yarn.lock)
# Isso permite que o Docker use o cache de camadas para as dependências se elas não mudarem
COPY package*.json ./

# Instalar as dependências do projeto
RUN npm install

# Copiar todo o restante do código da aplicação
COPY . .

# Construir a aplicação React para produção
# O comando 'npm run build' cria a pasta 'dist/' com os arquivos otimizados
RUN npm run build

# --- Estágio de Serviço (para servir os arquivos estáticos do React) ---
# Usar uma imagem base leve para servir os arquivos estáticos
# Nginx é um servidor web leve e performático, ideal para apps React estáticos
FROM nginx:stable-alpine as serve

# Remover a configuração padrão do Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Copiar a configuração personalizada do Nginx para o contêiner
# Esta configuração fará com que o Nginx sirva os arquivos da pasta 'dist/' do seu app
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copiar os arquivos de build do React do estágio 'build' para o estágio 'serve'
COPY --from=build /app/dist /usr/share/nginx/html

# Expor a porta 80 do contêiner (porta padrão HTTP)
EXPOSE 80

# Comando para iniciar o Nginx quando o contêiner for executado
CMD ["nginx", "-g", "daemon off;"]
