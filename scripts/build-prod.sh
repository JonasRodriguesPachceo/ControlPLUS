#!/bin/sh
set -e

# Build containers
docker compose build

# Composer & Node
docker compose run --rm app composer install --no-dev --optimize-autoloader
docker compose run --rm app npm ci
docker compose run --rm app npm run build

# Laravel cache
docker compose run --rm app php artisan config:cache
docker compose run --rm app php artisan route:cache
docker compose run --rm app php artisan view:cache
