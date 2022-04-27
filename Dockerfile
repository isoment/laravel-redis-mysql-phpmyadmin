FROM php:8.1-fpm-alpine

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN set -ex \
    && apk --no-cache add nodejs yarn npm vim curl zip unzip pcre-dev $PHPIZE_DEPS\
    && pecl install redis\
    && docker-php-ext-install pdo pdo_mysql\
    && docker-php-ext-enable redis.so\
    &&  echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini

WORKDIR /var/www/html