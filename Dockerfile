FROM php:7.4-fpm-alpine

# Apk install
RUN apk --no-cache update && apk --no-cache add bash git

RUN docker-php-ext-install pdo pdo_mysql

# install composer
RUN php -r  "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');" && mv composer.phar /usr/local/bin/composer

# install symfony
RUN wget https://get.symfony.com/cli/installer -O - | bash && mv /root/.symfony/bin/symfony /usr/local/bin/symfony


WORKDIR /var/www/html