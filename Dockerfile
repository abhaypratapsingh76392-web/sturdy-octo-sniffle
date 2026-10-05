# PHP aur Apache ka official base image
FROM php:8.2-apache

# Unzip tool install karein
RUN apt-get update && apt-get install -y unzip

# Server ki root directory set karein
WORKDIR /var/www/html/

# GitHub repo se zip file container mein copy karein
COPY cheakenselim.zip /var/www/html/

# Zip ko extract karein, files ko root folder mein laayein aur fir zip ko delete karein
RUN unzip cheakenselim.zip -d temp_extract && \
    mv temp_extract/cheakenselim/* . && \
    rm -rf temp_extract cheakenselim.zip

# Server permissions aur URL routing ko theek karein
RUN chown -R www-data:www-data /var/www/html/
RUN a2enmod rewrite

# Port 80 open karein
EXPOSE 80
