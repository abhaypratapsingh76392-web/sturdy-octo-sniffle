FROM php:8.2-apache
WORKDIR /var/www/html/

# Yeh line chken folder ka data direct root mein laayegi
COPY chken/ /var/www/html/

RUN chown -R www-data:www-data /var/www/html/
RUN a2enmod rewrite
EXPOSE 80
