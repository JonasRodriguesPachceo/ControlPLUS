# 🚀 Control Plus

Ambiente de desenvolvimento com **Laravel**, **MySQL**, **Redis**, **Node/Vite** e **Docker Compose**.

## ⚙️ Requisitos

-   Docker
-   Docker Compose v2+ (recomendado: v2.40.3)

## 🏁 Início Rápido

```bash
# Clone o repositório
git clone https://github.com/seuusuario/controlplus.git
cd controlplus
```

## ⚠️ Importante(antes de subir os containers): os arquivos .ENV e COMPOSE.ENV são obrigatórios.

## A ausência de qualquer um deles causará erro ao iniciar os containers.

# Crie os arquivos de ambiente

```bash
cp .env.example .env
cp compose.env.example compose.env
```

# Suba os containers

```bash
docker compose up -d
```

Se houver erro no build:

```bash
docker compose exec app bash
composer install
php artisan key:generate
npm install && npm run build
php artisan migrate --seed
exit
```

## 🌐 Portas Padrão

| Serviço | Porta | URL                   |
| ------- | ----- | --------------------- |
| Laravel | 8080  | http://localhost:8080 |
| Vite    | 5173  | http://localhost:5173 |
| MySQL   | 3307  | —                     |
| Redis   | 6379  | —                     |
| Mailpit | 1025  | —                     |

## 🧱 Tecnologias

Laravel • PHP 8.2 • MariaDB 11 • Redis 7 • Node 20 • Docker

## 🧰 Comandos Úteis

```bash
docker compose up -d       # subir
docker compose down        # parar
docker compose logs -f app # logs
docker compose exec app bash
```

## 📜 Licença

Este projeto possui **licença privada**.  
A reprodução, distribuição ou uso não autorizado é proibido sem permissão expressa do autor.
