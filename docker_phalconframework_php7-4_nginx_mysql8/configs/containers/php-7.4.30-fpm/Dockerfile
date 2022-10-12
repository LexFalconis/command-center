FROM composer:latest AS composer

FROM php:7.4.30-fpm-buster
LABEL maintainer='Alex L. Barros <lex.falconis@gmail.com>'
COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt-get update --yes
RUN apt-get install --yes
RUN apt-get install --yes autoconf \
    git \
    curl \
    zip \
    wget \
    gettext \
    libpcre3-dev \
    gcc
RUN pecl install phalcon


RUN docker-php-ext-install \
    mysqli \
    pdo \
    pdo_mysql
RUN echo 'alias phalcon="/var/www/html/vendor/phalcon/devtools/phalcon"' >> ~/.bashrc
# Fix Timezone America/Sao_Paulo
ENV TZ=America/Sao_Paulo

# Time Zone && Memory Limit
RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini \
    && echo "date.timezone=America/Sao_Paulo" > $PHP_INI_DIR/conf.d/date_timezone.ini

RUN apt-get clean -y
