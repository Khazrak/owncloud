FROM		ubuntu:14.04
MAINTAINER	Karl Andersson "karl.andersson1987@gmail.com"

ENV 		DEBIAN_FRONTEND noninteractive
RUN		apt-get update
RUN		apt-get upgrade -y
RUN		apt-get install wget apache2 libapache2-mod-php5 php5-gd php5-json php5-pgsql php5-mysql php5-sqlite php5-curl php5-intl php5-mcrypt php5-imagick -y
RUN		cd /tmp
RUN		wget https://download.owncloud.org/community/owncloud-7.0.3.tar.bz2
RUN		tar -xvjf owncloud-7.0.3.tar.bz2
RUN		mv owncloud /var/www/html
RUN		chown -R www-data:www-data /var/www/html/owncloud
RUN		a2enmod ssl
RUN		a2ensite default-ssl
ADD		default-ssl.conf /etc/apache2/sites-available/
RUN		a2enmod rewrite

EXPOSE 		443
ADD		config.sh /usr/bin/
RUN		chmod +x /usr/bin/config.sh	
ENTRYPOINT 	config.sh
