FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y
RUN apt install wget -y
RUN apt install php7.4 -y
RUN apt install php-fpm -y
RUN apt install php-mysql -y

COPY ./www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN mkdir -p /var/run/php/ && chown www-data:www-data /var/run/php/

COPY conf.sh /usr/bin/conf.sh
RUN chmod +x /usr/bin/conf.sh

CMD ["sh", "-c","/usr/bin/conf.sh"]