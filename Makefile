# ---------------------------------------
# Controle do ambiente Docker
# Esse Makefile facilita o gerenciamento/building do ambiente Docker
# Ele deve ser executado após configurar o arquivo .env
# Existem alvos para:
#   - first-build: build completo do ambiente (build + deps + key + migrate + seed)
#   - fresh-install: derruba tudo e recria o ambiente do zero
# ---------------------------------------

COMPOSE        = docker compose
APP_SERVICE    = app
DB_SERVICE     = db

COMPOSER_CMD ?= install
NPM_CMD      ?= install
ARTISAN_CMD  ?= list

DB_WAIT_RETRIES ?= 20      # máximo de tentativas de conexão db
DB_WAIT_SECONDS ?= 3       # segundos entre tentativas de conexão db

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

.PHONY: first-build fresh-install install \
	check-env wait-db perms composer npm artisan \
	migrate-seed key

# Primeira vez / setup completo (build + deps + key + migrate + seed)
first-build: check-env
	$(COMPOSE) up -d --build
	$(MAKE) install

# Install genérico reaproveitando os alvos existentes
install: composer npm key migrate-seed

# Reset total (derruba tudo, recria containers e roda first-build)
fresh-install:
	$(COMPOSE) down -v
	$(MAKE) first-build

# Garante pastas e permissões antes de qualquer coisa de app
perms:
	$(COMPOSE) exec $(APP_SERVICE) sh -c "\
		mkdir -p storage/logs bootstrap/cache && \
		chown -R www-data:www-data storage bootstrap/cache && \
		chmod -R 775 storage bootstrap/cache \
	"

composer: perms
	$(COMPOSE) exec $(APP_SERVICE) composer $(COMPOSER_CMD)

npm:
	$(COMPOSE) exec $(APP_SERVICE) npm $(NPM_CMD)

artisan:
	$(COMPOSE) exec $(APP_SERVICE) php artisan $(ARTISAN_CMD)

migrate-seed: wait-db
	$(MAKE) artisan ARTISAN_CMD="migrate --seed"

key:
	$(MAKE) artisan ARTISAN_CMD=key:generate
