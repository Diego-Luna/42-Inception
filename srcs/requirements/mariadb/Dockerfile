
# ////////////// temp

FROM	alpine:3.18

# Install MariaDB
RUN		apk update && apk upgrade &&\
		apk add mariadb mariadb-client

# Copy MariaDB configuration files
COPY	./config/configure-mariadb.sh /tmp/configure-mariadb.sh
RUN		chmod +x /tmp/configure-mariadb.sh

# Run MariaDB configuration script as entry point
ENTRYPOINT	[ "sh", "/tmp/configure-mariadb.sh" ]

# ////////////// temp



# FROM debian:buster

# # MAJ of apt-get, to get the last version of packages
# RUN apt-get update && apt-get upgrade -y

# # Install MariaDB server (MySQL)
# RUN apt-get install mariadb-server -y

# # Copy into the container the config file of MariaDB from folder conf
# COPY config/my.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# # Copy the bash script to create the database and the user into the container
# COPY config/auto_config.sh /auto_config.sh

# # Execute the bash script to create the database and the user
# ENTRYPOINT ["bash", "auto_config.sh"]

# # Expose the only port allowed by the subject (MySQL)
# EXPOSE 3306


# ///////
# FROM debian:buster

# RUN apt-get update && apt-get upgrade -y
# RUN apt-get install mariadb-server -y

# COPY config/50-server.cnf /50-server.cnf
# COPY config/configure-mariadb.sh /configure-mariadb.sh

# RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf && mv /50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# RUN chmod +x ./configure-mariadb.sh

# EXPOSE 3306

# ENTRYPOINT ["sh", "/configure-mariadb.sh"]

# COPY	./config/configure-mariadb.sh /tmp/configure-mariadb.sh
# RUN		chmod +x /tmp/configure-mariadb.sh

# # Run MariaDB configuration script as entry point
# ENTRYPOINT	[ "sh", "/tmp/configure-mariadb.sh" ]
