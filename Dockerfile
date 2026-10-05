# PHP aur Apache ka official base image
FROM php:8.2-apache

# Server ki root directory set karein
WORKDIR /var/www/html/

# GitHub repo se saari direct files ko container mein copy karein
COPY . /var/www/html/

# Server permissions aur URL routing ko theek karein
RUN chown -R www-data:www-data /var/www/html/
RUN a2enmod rewrite

# Port 80 open karein
EXPOSE 80
