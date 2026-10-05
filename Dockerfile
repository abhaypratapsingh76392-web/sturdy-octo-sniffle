FROM php:8.2-apache
WORKDIR /var/www/html/

# GitHub ki saari files server par copy karein
COPY . /var/www/html/

RUN chown -R www-data:www-data /var/www/html/
RUN a2enmod rewrite

# 403 Forbidden hatane aur browser mein files ki list dikhane ke liye setting
RUN echo "<Directory /var/www/html/>\n    Options +Indexes\n    AllowOverride All\n</Directory>" > /etc/apache2/conf-available/indexes.conf \
    && a2enconf indexes

EXPOSE 80
