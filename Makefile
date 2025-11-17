# ---------------------------------------
# Controle do ambiente Docker
# ---------------------------------------

COMPOSE        = docker compose
APP_SERVICE    = app
DB_SERVICE     = db

COMPOSER_CMD ?= install
NPM_CMD      ?= install
ARTISAN_CMD  ?= list

DB_WAIT_RETRIES ?= 20      # máximo de tentativas
DB_WAIT_SECONDS ?= 3       # segundos entre tentativas

# Variáveis obrigatórias no .env para subir o ambiente utilizadas pelo check-env
REQUIRED_ENV = \
	APP_ENV \
	APP_URL \
	DB_CONNECTION \
	DB_HOST \
	DB_PORT \
	DB_DATABASE \
	DB_USERNAME \
	DB_PASSWORD

check-env:
	@echo "Verificando arquivo .env..."
	@if [ ! -f .env ]; then \
		echo "ERRO: arquivo .env não encontrado na raiz do projeto."; \
		echo "Crie o arquivo com base no .env.example e ajuste as variáveis necessárias."; \
		echo "Comando sugerido: cp .env.example .env"; \
		exit 1; \
	fi; \
	missing=""; \
	for var in $(REQUIRED_ENV); do \
		if ! grep -q "^$$var=" .env; then \
			missing="$$missing $$var"; \
		fi; \
	done; \
	if [ -n "$$missing" ]; then \
		echo "ERRO: variáveis obrigatórias ausentes no .env:"; \
		echo "  $$missing"; \
		echo "Corrija o arquivo .env e execute novamente."; \
		exit 1; \
	fi; \
	echo ".env OK: todas as variáveis obrigatórias foram encontradas."


wait-db:
	@echo "Aguardando banco de dados ficar pronto..."
	@$(COMPOSE) exec $(DB_SERVICE) sh -c '\
		i=0; \
		while ! mysqladmin ping -h"localhost" --silent; do \
			i=$$((i+1)); \
			if [ $$i -ge $(DB_WAIT_RETRIES) ]; then \
				echo "ERRO: MySQL não subiu após $(DB_WAIT_RETRIES) tentativas."; \
				exit 1; \
			fi; \
			echo "   tentativa $$i: aguardando MySQL..."; \
			sleep $(DB_WAIT_SECONDS); \
		done; \
	'
	@echo "✅ Banco de dados pronto."

.PHONY: up down restart logs build install fresh-install \
	composer npm artisan migrate rollback seed fresh key \
	tinker bash dbbash perms

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

restart:
	$(COMPOSE) down
	$(COMPOSE) up -d

logs:
	$(COMPOSE) logs -f

build:
	$(COMPOSE) build

# Primeira vez / setup completo (build + deps + key + migrate + seed)
first-build: check-env
	$(COMPOSE) up -d --build
	$(COMPOSE) exec $(APP_SERVICE) composer install
	$(COMPOSE) exec $(APP_SERVICE) npm install
	$(MAKE) perms
	$(COMPOSE) exec $(APP_SERVICE) php artisan key:generate
	$(MAKE) migrate-seed


# Reset total (derruba tudo, recria containers e roda install)
fresh-install: $(COMPOSE) down -v $(MAKE) install

composer:
	$(COMPOSE) exec $(APP_SERVICE) composer $(COMPOSER_CMD)

npm:
	$(COMPOSE) exec $(APP_SERVICE) npm $(NPM_CMD)

artisan:
	$(COMPOSE) exec $(APP_SERVICE) php artisan $(ARTISAN_CMD)

migrate-seed: wait-db
	$(COMPOSE) exec $(APP_SERVICE) php artisan migrate --seed

migrate:
	$(COMPOSE) exec $(APP_SERVICE) php artisan migrate

rollback:
	$(COMPOSE) exec $(APP_SERVICE) php artisan migrate:rollback

seed:
	$(COMPOSE) exec $(APP_SERVICE) php artisan db:seed

fresh:
	$(COMPOSE) exec $(APP_SERVICE) php artisan migrate:fresh --seed

key:
	$(COMPOSE) exec $(APP_SERVICE) php artisan key:generate

tinker:
	$(COMPOSE) exec $(APP_SERVICE) php artisan tinker

bash:
	$(COMPOSE) exec $(APP_SERVICE) bash

dbbash:
	$(COMPOSE) exec $(DB_SERVICE) sh -c 'mysql -u$$DB_USERNAME -p$$DB_PASSWORD $$DB_DATABASE'

perms:
	$(COMPOSE) exec $(APP_SERVICE) sh -c "\
		mkdir -p storage/logs bootstrap/cache && \
		chown -R www-data:www-data storage bootstrap/cache && \
		chmod -R 775 storage bootstrap/cache \
	"
