# =========================
# Stage 1: Composer vendor
# =========================
FROM composer:2 AS vendor
WORKDIR /app
# aceita ausência do composer.lock no primeiro build
COPY composer.json composer.lock* ./
RUN composer install --no-interaction --prefer-dist --no-scripts --no-progress


# ==================================
# Stage 2: App (PHP-FPM) production
# ==================================
FROM php:8.3-fpm-alpine

ARG PUID=1000
ARG PGID=1000

ENV APP_DIR=/var/www/html \
    PHP_OPCACHE_VALIDATE_TIMESTAMPS=1

WORKDIR ${APP_DIR}

# deps + extensões
RUN apk add --no-cache \
    bash git unzip icu-dev libpng-dev libjpeg-turbo-dev oniguruma-dev libzip-dev \
    freetype-dev autoconf g++ make acl ca-certificates openssl-dev \
    && update-ca-certificates \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" pdo_mysql intl bcmath gd zip opcache \
    \
    # --- Instalar e habilitar Redis ---
    && pecl install redis \
    && docker-php-ext-enable redis \
    \
    # limpeza
    && apk del autoconf g++ make \
    && rm -rf /tmp/pear

RUN apk add --no-cache libpng libpng-dev libjpeg-turbo-dev freetype-dev && \
    docker-php-ext-install pdo_mysql mysqli && \
    docker-php-ext-enable mysqli


# Copiar binário do composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# --- Usuário/grupo harmonizados com host ---
RUN addgroup -g ${PGID} -S www || true \
    && adduser  -S -D -H -u ${PUID} -G www app \
    && addgroup app www || true

# Ajustar PHP-FPM para rodar como app:www
RUN sed -i -E 's|^user = .*$|user = app|g; s|^group = .*$|group = www|g' /usr/local/etc/php-fpm.d/www.conf \
    && sed -i -E 's|^;?listen.owner =.*$|listen.owner = app|g; s|^;?listen.group =.*$|listen.group = www|g' /usr/local/etc/php-fpm.d/www.conf

# php.ini local (se existir)
COPY docker/php/local.ini /usr/local/etc/php/conf.d/local.ini

# Copiar app (use .dockerignore para não enviar node_modules/vendor)
COPY . ${APP_DIR}
# Trazer vendor da stage composer
COPY --from=vendor /app/vendor ${APP_DIR}/vendor

# Criar dirs críticos e ajustar permissões
RUN mkdir -p ${APP_DIR}/storage/logs \
    ${APP_DIR}/storage/framework/{cache,sessions,testing,views} \
    ${APP_DIR}/bootstrap/cache \
    && chown -R app:www ${APP_DIR}/storage ${APP_DIR}/bootstrap/cache \
    && find ${APP_DIR}/storage ${APP_DIR}/bootstrap/cache -type d -exec chmod 2775 {} \; \
    && find ${APP_DIR}/storage ${APP_DIR}/bootstrap/cache -type f -exec chmod 0664 {} \; \
    && touch ${APP_DIR}/storage/logs/laravel.log \
    && chmod 0664 ${APP_DIR}/storage/logs/laravel.log \
    && setfacl -Rm g:www:rwx ${APP_DIR}/storage ${APP_DIR}/bootstrap/cache || true

USER app

EXPOSE 9000
CMD ["php-fpm"]
