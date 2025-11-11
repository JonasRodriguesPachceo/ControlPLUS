<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

# 🚀 Control Plus

Este projeto utiliza **Docker Compose** para orquestrar o ambiente de desenvolvimento, garantindo que todos os serviços (PHP, MySQL, Redis, Node/Vite) rodem de forma consistente e isolada.

## 🛠️ Requisitos

-   **Docker**
-   **Docker Compose** (V2 ou V1 com flag `--compatibility`)

---

## 🏁 Como Iniciar

1.  **Copie o Arquivo de Configuração**
    Crie o seu arquivo de variáveis de ambiente a partir do exemplo fornecido (se houver, ou apenas garanta que o `.env` esteja na raiz):

    ```bash
    cp .env.example .env
    ```

2.  **Inicie os Serviços**
    Execute o comando para subir todos os contêineres em background:

    ```bash
    docker compose --compatibility up -d
    ```

    _(O flag `--compatibility` é importante para compatibilidade com a sintaxe V1 e V2 do Compose, especialmente no mapeamento de portas e recursos)._

    ### !IMPORTANTE! (apenas se houver erro no build)

3.  **Acesse o Container e Instale as Dependências**
    Entre no container principal da aplicação para instalar as dependências do Laravel e Node:

    ```bash
    docker compose exec app bash
    ```

    _Dentro do container, execute:_

    ```bash
    # Instalação das dependências PHP
    composer install

    # Geração da APP_KEY (necessária)
    php artisan key:generate

    # Instalação das dependências Node e compilação inicial
    npm install
    npm run build

    # Opcional: Rodar as migrações e seeders
    php artisan migrate --seed
    ```

    _Saia do container com `exit`._

---

## 🌐 Acessos e Portas

Os serviços ficam disponíveis nas seguintes URLs e portas na sua máquina local (Host):

| Serviço                        | Porta Externa (Host) | URL de Acesso                       | Configuração no `.env`         |
| :----------------------------- | :------------------- | :---------------------------------- | :----------------------------- |
| **Aplicação (Laravel)**        | **`8080`**           | `http://localhost:8080`             | Variável: `APP_PORT`           |
| **Frontend Dev Server (Vite)** | **`5173`**           | `http://localhost:5173`             | Variável: `VITE_PORT`          |
| **Banco de Dados (MySQL)**     | **`3307`**           | Conexão via ferramentas externas    | Variável: `FORWARD_DB_PORT`    |
| **Redis**                      | **`6379`**           | Cache e Filas                       | Variável: `FORWARD_REDIS_PORT` |
| **Fake SMTP (Mailpit)**        | **`1025`**           | Usado para envio de emails de teste | Variável: `MAIL_PORT`          |

---

## 💻 Desenvolvimento Frontend

Para iniciar o servidor de desenvolvimento Vite, que fornece hot-reload:

```bash
docker compose exec app npm run dev
```
