FROM php:8.1-fpm-alpine

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN set -ex \
    && apk --no-cache add nodejs yarn npm vim curl zip unzip\
    && docker-php-ext-install pdo pdo_mysql

WORKDIR /var/www/html