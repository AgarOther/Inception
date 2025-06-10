FROM debian:bullseye

# PACKAGES
RUN apt update -y && apt upgrade -y && apt install -y curl php-fpm php-mysqli

# CONFIG
RUN mkdir -p /run/php
RUN chown -R www-data:www-data /run/php
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
WORKDIR /var/www/html
RUN chown -R www-data:www-data /var/www/html

# SCRIPT
COPY ./tools/script.sh .
RUN chmod +x script.sh

EXPOSE 9000

ENTRYPOINT ["sh", "-c", "/var/www/html/script.sh" ]
