FROM debian:latest

RUN apt-get update && \
	apt-get install -y \
		mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY ./tools/script.sh ./tools/.

RUN mkdir /run/mysqld && chmod +x ./tools/script.sh

CMD [ "./tools/script.sh" ]