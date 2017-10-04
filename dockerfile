FROM ruby:2.3-slim

# Instala as nossas dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    build-essential libpq-dev

#Seta nosso path
ENV INSTALL_PATH /frank-bot

#Cria o diretorio
RUN mkdir -p $INSTALL_PATH

#Seta nosso path como principal
WORKDIR $INSTALL_PATH

#Copia o Gemfile para o container
COPY Gemfile ./

#Faz a instalação das gems
RUN bundle install

#Copia todos os arquivos
COPY . .

#Sobe o servidor
CMD rackup config.ru -o 0.0.0.0
