# ---------------------------------------
# Controle do ambiente Docker
# ---------------------------------------

COMPOSE        = docker compose
APP_SERVICE    = app
DB_SERVICE     = db

COMPOSER_CMD ?= install
NPM_CMD      ?= install
ARTISAN_CMD  ?= list

container: install

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
install:
	$(COMPOSE) up -d --build
	$(COMPOSE) exec $(APP_SERVICE) composer install
	$(COMPOSE) exec $(APP_SERVICE) npm install
	$(MAKE) perms
	$(COMPOSE) exec $(APP_SERVICE) php artisan key:generate
	$(COMPOSE) exec $(APP_SERVICE) php artisan migrate --seed

# Reset total (derruba tudo, recria containers e roda install)
fresh-install:
	$(COMPOSE) down -v
	$(MAKE) install

composer:
	$(COMPOSE) exec $(APP_SERVICE) composer $(COMPOSER_CMD)

npm:
	$(COMPOSE) exec $(APP_SERVICE) npm $(NPM_CMD)

artisan:
	$(COMPOSE) exec $(APP_SERVICE) php artisan $(ARTISAN_CMD)

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
		chmod -R 775 storage/bootstrap/cache \
	"
