FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y

# COPY config/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY config/50-server.cnf /50-server.cnf
COPY config/script.sh /script.sh

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf && mv /50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# RUN mkdir -p /run/mysqld;
RUN chmod +x ./script.sh

EXPOSE 3306

ENTRYPOINT ["sh", "/script.sh"]
# ENTRYPOINT ["/script.sh"]

CMD ["mysqld"]