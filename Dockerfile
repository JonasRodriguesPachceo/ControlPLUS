# -------------------------
# Build stage
# -------------------------
FROM php:8.2-fpm AS build

WORKDIR /var/www/html

# Variáveis de build (para garantir que composer scripts não quebrem)
ARG APP_ENV=production
ARG APP_KEY
ENV APP_ENV=${APP_ENV} APP_KEY=${APP_KEY}

# Instala dependências do sistema, PHP e Node 18 (flexível)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git unzip curl ca-certificates \
    libzip-dev libpng-dev libjpeg-dev libfreetype6-dev \
    libicu-dev libonig-dev libxml2-dev \
    zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        bcmath \
        exif \
        gd \
        intl \
        pcntl \
        pdo_mysql \
        sockets \
        zip \
        soap \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Ajusta UID/GID do www-data para bater com o host
ARG UID=1000
ARG GID=33
RUN groupmod -g ${GID} www-data \
    && usermod -u ${UID} -g ${GID} www-data

# Composer da imagem oficial
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copia código e instala dependências
COPY . .

# Instala dependências do Laravel e Node
RUN composer install --no-dev --no-interaction --prefer-dist --optimize-autoloader --ignore-platform-reqs
RUN npm ci
RUN npm run build \
    && rm -rf node_modules

# -------------------------
# Runtime stage
# -------------------------
FROM php:8.2-fpm AS runtime

WORKDIR /var/www/html

# Dependências runtime (genéricas, flexíveis)
RUN apt-get update && apt-get install -y --no-install-recommends \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libicu-dev \
    libonig-dev \
    libxml2-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        bcmath \
        exif \
        gd \
        intl \
        pcntl \
        pdo_mysql \
        sockets \
        zip \
        soap \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copia todo do build
COPY --from=build /var/www/html /var/www/html

# Permissões de storage e cache
RUN mkdir -p storage/logs bootstrap/cache \
    && chown -R www-data:www-data storage bootstrap/cache \
    && chmod -R 775 storage bootstrap/cache

# Porta exposta para Coolify
EXPOSE 9000

# Start
CMD ["php-fpm"]
