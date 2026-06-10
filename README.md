# README

# Sumário
* [A - Executando o docker-compose.yml](#executando-o-docker-composeyml)
* [B - Usando o SQL Notebook](#usando-o-sql-notebook)
* [C - DevContainer com Python 3 & Postgres & psql](#devcontainer-com-python-3--postgres--psql)

## A - Executando o `docker-compose.yml`

### Crie um fork no `github` (Web) do repositório template `dbdevcontainer`

### Clone o repositório localmente

<pre>
$ git clone [meu_fork_do_dbdevcontainer]
</pre>

### Abra o PowerShell (Terminal) e posicione no diretório `.devcontainer`

<pre>
$ cd [meu_fork_do_db_devcontainer]\.devcontainer
</pre>

### Execute o comando `docker`

<pre>
$ docker compose up
</pre>

## B - Usando o SQL Notebook / SQLTools

### Criando a conexão

1. Selecione a extensão `SQL Notebook` / `SQLTools`
1. Na aba do `SQL Notebook` / `SQLTools`, preencha os parâmetros de conexão
    - Display name: "db_server" 
    - Database Driver: "postgres"
    - Database Host: "localhost"
    - Database Port: "5432"
    - Database User: "postgres"
    - Database Password: "postgres"
    - Database Name: "postgres"
1. E, finalmente, clique em "Create"

### Executando os comandos em um script SQL no `SQL Notebook`
1. Clique com o botão esquerdo do mouse no script SQL
1. Selecione "Abrir com", e, em seguida, "SQL Notebook"

- Observe que cada comando pode ser executado individualmente usando o ícone do "play".
- O script pode conter comando SQL e comentários Markdown.

## C - DevContainer com Python 3 & Postgres & psql

### Configuração do DevContainer
1. Na barra de comandos digite `> add devcontainer`
1. Em seguida, selecione a opção `create a new configuration...`
1. Procure por `Pyhton 3 & Postgres`
1. Escolha a versão `default`
1. Acrescente o pacote `PostgreSQL Client`
1. E siga as instruções para a finalização do processo e do **rebuild**

### Configuração do CloudBeaver
[1] https://github.com/dbeaver/cloudbeaver/wiki/Run-Docker-Container

[2] https://github.com/dbeaver/cloudbeaver/wiki/CloudBeaver-Community-deployment-from-docker-image
