# 🚀 Meu Primeiro Aplicativo React

Este é um projeto de exemplo de um aplicativo React, **criado e gerenciado usando Vite**. Ele serve como frontend para uma demonstração de deploy automatizado em infraestrutura de nuvem.

---

## ✨ Visão Geral do Projeto

Este repositório contém o código-fonte da aplicação React. O foco principal deste projeto é demonstrar como uma aplicação frontend moderna pode ser desenvolvida, containerizada com Docker e, posteriormente, integrada em um fluxo de deployment automatizado.

---

## 🏁 Primeiros Passos

Para começar a trabalhar com este projeto, siga as instruções abaixo.

### Clonar o Repositório

Primeiro, clone este repositório para sua máquina local usando o Git:

```bash
git clone [https://github.com/renatalamb/meu-primeiro-react-app.git](https://github.com/renatalamb/meu-primeiro-react-app.git)
```

---

## 🛠️ Pré-requisitos para Desenvolvimento Local

Certifique-se de ter o seguinte software instalado em sua máquina local para desenvolver e rodar este aplicativo:

* **Node.js:** Versão 14.x ou superior (recomendado a versão LTS mais recente).
* **npm** (Node Package Manager) ou **Yarn**: Geralmente vêm com a instalação do Node.js.
* **Docker Desktop:** Para rodar a aplicação em um ambiente containerizado localmente.

---


## 🚀 Como Rodar o Aplicativo Localmente

Você tem duas opções para rodar este aplicativo em sua máquina local: diretamente (usando Node.js com Vite) ou via Docker.

### Opção 1: Rodar Diretamente (usando Node.js e Vite)

1.  **Instale as dependências:**
    Navegue até o diretório raiz deste projeto no seu terminal (`cd /caminho/para/meu-primeiro-react-app`) e execute:
    ```bash
    npm install
    # ou, se você usa Yarn:
    # yarn install
    ```

2.  **Inicie o aplicativo em modo de desenvolvimento:**
    ```bash
    npm run dev
    # ou, se você usa Yarn:
    # yarn dev
    ```
    Cole o caminho `http://localhost:3113` que vai aparecer no seu terminal no seu navegador. 

### Opção 2: Rodar com Docker (Recomendado para consistência)

Esta é a forma como o aplicativo será executado no ambiente de produção (EC2).

1.  **Construa a Imagem Docker:**
    Navegue até o diretório raiz deste projeto (onde o `Dockerfile` está localizado) no seu terminal e execute:
    ```bash
    docker build -t meu-react-app .
    ```
    * `-t meu-react-app`: Atribui um nome (`tag`) à imagem Docker.
    * `.`: Indica que o `Dockerfile` está no diretório atual.

2.  **Execute o Contêiner Docker Localmente:**
    Após a imagem ser construída, você pode iniciar um contêiner a partir dela:
    ```bash
    docker run -d -p 3113:80 --name meu-react-app-container meu-react-app
    ```
    * `-d`: Roda o contêiner em modo *detached* (em segundo plano).
    * `-p 3113:80`: Mapeia a porta `3113` da sua máquina local para a porta `80` dentro do contêiner (onde o servidor Nginx está servindo o aplicativo React).
    * `--name meu-react-app-container`: Atribui um nome para o contêiner, facilitando seu gerenciamento.
    * `meu-react-app`: O nome da imagem Docker a ser utilizada.

3.  **Acesse o Aplicativo:**
    Com o contêiner em execução, acesse seu aplicativo React no navegador:
    ```
    http://localhost:3113
    ```

### Comandos Docker Úteis (Opcional)

Aqui estão alguns comandos Docker que podem ser úteis para gerenciar o contêiner localmente:

* **Listar contêineres em execução:**
    ```bash
    docker ps
    ```
* **Verificar logs do contêiner:**
    ```bash
    docker logs meu-react-app-container
    ```
* **Parar o contêiner:**
    ```bash
    docker stop meu-react-app-container
    ```
* **Remover o contêiner (deve estar parado primeiro):**
    ```bash
    docker rm meu-react-app-container
    ```
* **Remover a imagem Docker (após remover todos os contêineres que a utilizam):**
    ```bash
    docker rmi meu-react-app
    ```

---

## 📦 Deploy para Produção

Este aplicativo é deployado automaticamente em uma instância AWS EC2. O processo de infraestrutura e deployment é gerenciado por um **repositório separado**:

* **[minha-infra-react-app](https://github.com/renatalamb/minha-infra-react-app)** 

Este repositório de infraestrutura utiliza **Terraform** para provisionar os recursos AWS e **Ansible** para configurar a instância e fazer o deployment do contêiner Docker. Por questões de segurança, este repositório está privado. Mas segui este [tutorial](https://dev.to/mariehposa/how-to-deploy-an-application-to-aws-ec2-instance-using-terraform-and-ansible-3e78) para realizar os próximos passos.

---
