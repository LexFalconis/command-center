FROM php:7.2.10-apache

LABEL maintainer='Alex L. Barros <lex.falconis@gmail.com>'

# Update and Download Packages Debian
RUN apt-get update --yes

# Install Dependencies
RUN apt-get install --yes \
 autoconf \
 bzip2 \
 curl \
 gettext \
 git \
 g++ \
 freetds-bin \
 freetds-dev \
 freetds-common \
 make \
 libbz2-dev \
 libcurl4-openssl-dev \
 libicu-dev \
 libzip-dev \
 libfreetype6-dev \
 libgd-dev \
 libjpeg62-turbo-dev \
 libpq-dev\
 libpng-dev \
 libssl-dev\
 libtidy-dev \
 libxslt-dev \
 libxml2-dev \
 pkg-config \
 subversion \
 tar \
 unzip \
 zlib1g-dev \
 zip

# Install Extensions
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install bz2
RUN docker-php-ext-install calendar
RUN docker-php-ext-install exif
RUN docker-php-ext-install gd
RUN docker-php-ext-install gettext
RUN docker-php-ext-install intl
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install soap
RUN docker-php-ext-install sockets
RUN docker-php-ext-install tidy
RUN docker-php-ext-install xmlrpc
RUN docker-php-ext-install xsl
RUN docker-php-ext-install zip
RUN docker-php-ext-configure hash --with-mhash

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/lib/x86_64-linux-gnu/ --with-jpeg-dir=/usr/lib/x86_64-linux-gnu/

RUN docker-php-ext-configure intl
RUN docker-php-ext-configure zip --with-libzip;

# Memory Limit
RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini

# Time Zone
RUN echo "date.timezone=${PHP_TIMEZONE:-UTC}" > $PHP_INI_DIR/conf.d/date_timezone.ini

# SET timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install Composer
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install XDebug
RUN pecl install xdebug-2.6.0
RUN docker-php-ext-enable xdebug

RUN a2enmod rewrite

# Clean
RUN apt-get clean -y
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

WORKDIR "/var/www/html"

EXPOSE 80
