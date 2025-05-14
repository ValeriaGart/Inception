FROM debian:latest

RUN apt update && apt upgrade -y && apt install -y \
    php-fpm php-mysqli curl wget php8.2

COPY www.conf /etc/php/8.2/fpm/pool.d/.
RUN mkdir -p /var/run/php/ && chown www-data:www-data /var/run/php/
COPY wpscript.sh .
RUN chmod +x wpscript.sh


CMD ["./wpscript.sh"]