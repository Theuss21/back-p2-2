# Exemplo de Dockerfile otimizado:
FROM php:8.3-fpm-alpine

WORKDIR /var/www

# Instala dependências e extensões
RUN apk add --no-cache git libzip-dev libpng-dev \
    && docker-php-ext-install pdo_mysql opcache gd exif pcntl bcmath zip

# Instala o Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Configura permissões
RUN usermod -u 1000 www-data