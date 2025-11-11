#!/usr/bin/env sh
set -eu
cd /var/www/html

# Composer (first run)
if [ ! -d vendor ]; then
  composer install --no-interaction --prefer-dist --no-progress || exit 1
fi

# .env and APP_KEY
if [ ! -s .env ] && [ -f .env.example ]; then
  cp .env.example .env
fi
if ! grep -q '^APP_KEY=' .env || grep -q '^APP_KEY=$' .env; then
  php artisan key:generate || true
fi

# DB wait + migrate + seed (always, per your test phase)
chmod +x docker/app/run_migrations.sh
docker/app/run_migrations.sh

# Permissions (use numeric IDs to avoid “user not found”)
if [ -d storage ]; then
  UID_NOW="${PUID:-$(id -u)}"
  GID_NOW="${PGID:-$(id -g)}"
  chmod -R 775 storage bootstrap/cache || true
  chown -R "$UID_NOW:$GID_NOW" storage bootstrap/cache || true

fi

# Hand off to php-fpm
exec php-fpm
