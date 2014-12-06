#!/bin/bash

echo "ServerName $SERVER_NAME" | sudo tee /etc/apache2/conf-available/servername.conf;
a2enconf servername;
sed -i "s/SSLKEY/$SSL_KEY/g" /etc/apache2/sites-available/default-ssl.conf;
sed -i "s/S_NAME/$SERVER_NAME/g" /etc/apache2/sites-available/default-ssl.conf;
sed -i "s/SSLCERT/$SSL_CERT/g" /etc/apache2/sites-available/default-ssl.conf;
/usr/sbin/apache2ctl -D FOREGROUND;




