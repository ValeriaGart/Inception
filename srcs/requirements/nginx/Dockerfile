FROM debian:latest

RUN apt update && apt upgrade && apt install -y \
	nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/vharkush.crt -keyout /etc/nginx/ssl/vharkush.key -subj "/C=AT/ST=W/L=Vienna/O=42/OU=42/CN=vharkush.42.fr/UID=login"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/sites-available/default.conf
RUN rm -f /etc/nginx/sites-enabled/default && ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

CMD ["nginx", "-g", "daemon off;"]
