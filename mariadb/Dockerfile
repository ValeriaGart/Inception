FROM debian:bullseye

RUN apt update && apt upgrade -y
RUN apt install -y mariadb-server

# Configure MariaDB to accept connections from all IPs
RUN sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY mdb_script/mariadb.sh /usr/bin/mariadb.sh
RUN chmod +x /usr/bin/mariadb.sh

CMD [ "/usr/bin/mariadb.sh" ]