FROM jenkins/jenkins:latest
USER root

# Definir a versão do Go
ARG GO_VERSION=1.22.0

# Instalar dependências necessárias
RUN apt-get update && apt-get install -y make git wget

# Baixar e instalar o Go
RUN wget https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz && \
    rm go${GO_VERSION}.linux-amd64.tar.gz

# Criar diretório de backup e ajustar as permissões
RUN mkdir /srv/backup && chown jenkins:jenkins /srv/backup

# Definir variáveis de ambiente para o Go
ENV PATH=$PATH:/usr/local/go/bin
ENV GOPATH=$HOME/go

ENV JENKINS_UC_DOWNLOAD="http://mirrors.jenkins-ci.org"

# Mudar para o usuário jenkins
USER jenkins

# Copiar lista de plugins e instalar plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

USER root

COPY . /meu_projeto_go

# Mudar para o diretório do projeto e construir o projeto Go (ajuste conforme necessário)
WORKDIR /meu_projeto_go
RUN go build -o meu_app

USER jenkins
