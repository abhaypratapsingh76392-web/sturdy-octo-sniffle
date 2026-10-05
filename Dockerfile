# PHP aur Apache ka official base image
FROM php:8.2-apache

# Unzip tool install karein taaki zip file khul sake
RUN apt-get update && apt-get install -y unzip

# Server ki root directory set karein
WORKDIR /var/www/html/

# GitHub se chken.zip aur Dockerfile server par copy karein
COPY . /var/www/html/

# Zip file ko extract karein, saari files bahar nikaalein aur zip ko delete kar dein
RUN unzip chken.zip -d temp_folder && \
    cp -r temp_folder/* . && \
    rm -rf temp_folder chken.zip

# Server permissions aur URL routing ko theek karein
RUN chown -R www-data:www-data /var/www/html/
RUN a2enmod rewrite

# Port 80 open karein
EXPOSE 80
