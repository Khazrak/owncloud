#!/bin/bash


sed -i "s/SSLKEY/$SSL_KEY/g" /etc/apache2/sites-available/default-ssl.conf;
sed -i "s/S_NAME/$SERVER_NAME/g" /etc/apache2/sites-available/default-ssl.conf;
sed -i "s/S_NAME/$SERVER_NAME/g" /etc/apache2/sites-available/default-ssl.conf;
sed -i "s/SSLCERT/$SSL_CERT/g" /etc/apache2/sites-available/default-ssl.conf;
echo "ServerName $SERVER_NAME:443" | sudo tee /etc/apache2/conf-available/fqdn.conf
a2enconf fqdn

/usr/sbin/apache2ctl start
