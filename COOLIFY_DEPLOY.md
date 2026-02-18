# Deploy no Coolify - ControlPLUS

## Arquivo de compose
Use `docker-compose.yml` (produção).

## Variáveis obrigatórias (Coolify Environment)
- `APP_KEY`
- `APP_URL`
- `APP_ENV=production`
- `APP_DEBUG=false`
- `DB_CONNECTION=mysql`
- `DB_HOST=db`
- `DB_PORT=3306`
- `DB_DATABASE`
- `DB_USERNAME`
- `DB_PASSWORD`
- `MYSQL_ROOT_PASSWORD`

Base sugerida: `.env.production.example`.

## Passos
1. Crie um recurso Docker Compose no Coolify para este projeto.
2. Selecione `docker-compose.yml`.
3. Defina as variáveis no painel do Coolify.
4. Faça deploy.
5. Execute pós-deploy no serviço `app`:
   - `php artisan migrate --force`
6. Valide healthcheck em `GET /api/health`.

## Desenvolvimento local
Para manter o fluxo atual com `make`:
```bash
make up
```
O `Makefile` agora usa automaticamente `docker-compose.yml + docker-compose.dev.yml`.
