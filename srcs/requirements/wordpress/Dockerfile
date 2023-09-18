
# ///////// temp

FROM	alpine:3.18

# Install PHP 8.1 & MariaDB-client dependencies
RUN		apk update && apk upgrade &&\
		apk add php81 php81-fpm php81-bcmath php81-bz2 php81-calendar php81-cli php81-ctype \
			php81-curl php81-dom php81-exif php81-fileinfo php81-gd php81-gmp \
			php81-iconv php81-imap php81-intl php81-json php81-mbstring \
			php81-mysqli php81-mysqlnd php81-openssl php81-pcntl php81-pdo php81-pdo_mysql \
			php81-pdo_pgsql php81-pdo_sqlite php81-pgsql php81-phar php81-posix php81-session \
			php81-shmop php81-simplexml php81-soap php81-sockets php81-sodium php81-sqlite3 \
			php81-sysvsem php81-sysvshm php81-tokenizer php81-xml php81-xmlreader php81-xmlwriter \
			php81-xsl php81-zip php81-zlib &&\
		apk add mariadb-client

# Configure PHP-fpm to listen on internal inception network port 9000
RUN		sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g' /etc/php81/php-fpm.d/www.conf

# Install WP-CLI
#	Moving wp-cli.phar to /usr/bin/wp-cli.phar rather than /usr/bin/wp to avoid
#	PHP errors for phar vendors files missing. This is a wp-cli bug:
#		https://github.com/wp-cli/config-command/issues/141
#		https://github.com/wp-cli/config-command/issues/31
#		https://github.com/wp-cli/wp-cli/issues/4689#issuecomment-366428642
RUN		apk add curl &&\
		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
		chmod +x wp-cli.phar &&\
		mv wp-cli.phar /usr/bin/wp-cli.phar

# Copy WordPress configuration file
COPY	./config/configure-wordpress.sh /tmp/configure-wordpress.sh
RUN		chmod +x /tmp/configure-wordpress.sh

WORKDIR /var/www/html/wordpress

# Run the WordPress configuration file at container startup
ENTRYPOINT	[ "sh", "/tmp/configure-wordpress.sh" ]


# ///////// temp



# FROM debian:buster

# RUN apt-get update && apt-get upgrade -y

# # installe wget pour installer WP
# RUN apt-get -y install wget

# # installe PHP 
# RUN apt-get install -y php7.3\
# 	php-fpm\
# 	php-mysql\
# 	mariadb-client

# # indique dans quel dossier on veut telecharger le fichier en utilisant -P
# RUN wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www

# # décompresse le fichier pour obtenir le dossier WP puis supprime le .tar (compressé) qui ne sert plus à rien
# RUN cd /var/www && tar -xzf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz

# # donne les droits à root d'écrire dans ce dossier
# RUN	chown -R root:root /var/www/wordpress

# # installe la CLI de WP(interface textuelle qui traite les commandes vers un programme informatique -> pratique pour la config automatique -mdp, nom, host)
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# # donne les droits à la CLI et place les binaires
# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

# # copie le fichier de config dans le container 
# # COPY	./config/confi.conf	/etc/php/7.3/fpm/pool.d/www.conf
# COPY	config/auto_config.sh auto_config.sh

# ENTRYPOINT ["bash", "auto_config.sh"]

# //////////////////////
# # syntax=docker/dockerfile:1
# FROM debian:buster

# RUN apt-get update && apt-get upgrade -y

# RUN apt-get -y install wget


# RUN apt-get install -y php7.3\
#                         php-fpm\
#                         php-mysql\
#                         mariadb-client

# RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

# RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# RUN		chown -R root:root /var/www/wordpress

# # configuracion
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

# # files
# # auto_config.sh
# COPY config/auto_config.sh ./auto_config.sh
# RUN chmod +x ./auto_config.sh


# ENTRYPOINT ["bash", "./auto_config.sh"]
