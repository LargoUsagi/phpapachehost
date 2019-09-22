FROM php:apache
RUN a2enmod rewrite && apt-get update && apt-get install -y sendmail sendmail-bin mailutils libpng-dev libjpeg62-turbo-dev libfreetype6-dev libmcrypt-dev
RUN docker-php-ext-install -j$(nproc) iconv \
 && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
 && docker-php-ext-install -j$(nproc) gd \
 && docker-php-ext-install opcache \
 && docker-php-ext-install mysqli && docker-php-ext-enable mysqli \
 && docker-php-ext-install redis && docker-php-ext-enable redis
 && apt-get clean
