FROM composer:latest AS composer

FROM php:7.4.11-fpm
LABEL maintainer='Alex L. Barros <lex.falconis@gmail.com>'
COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt-get update --yes && apt-get install --yes \
    autoconf \
    git \
    curl \
    zip

RUN docker-php-ext-install \
    bcmath \
    json \
    mysqli \
    pdo \
    pdo_mysql

# Fix Timezone America/Sao_Paulo
ENV TZ=America/Sao_Paulo

# Time Zone && Memory Limit
RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini \
    && echo "date.timezone=America/Sao_Paulo" > $PHP_INI_DIR/conf.d/date_timezone.ini

RUN apt-get clean -y
