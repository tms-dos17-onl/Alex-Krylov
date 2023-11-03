FROM php:apache

RUN apt-get update && apt-get install -y \
 python3-mysqldb \
 systemd 


RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli&& docker-php-ext-install pdo pdo_mysql



 EXPOSE 80