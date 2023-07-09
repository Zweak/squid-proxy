#!/bin/bash
echo "Enter username, password, and port (space separated): "
read username password port
apt update && apt install squid apache2-utils -y #interruption here
htpasswd -c /etc/squid/passwords $username

# Backup original squid.conf 
mv /etc/squid/squid.conf /etc/squid/squid.conf.Original
cd /etc/squid && touch squid.conf

cat << EOF >> /etc/squid/squid.conf
auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwords
auth_param basic realm proxy
acl authenticated proxy_auth REQUIRED
http_access allow authenticated
http_access deny all
dns_v4_first on
forwarded_for delete
via off
http_port $port
EOF

ufw allow $port
ufw allow OpenSSH
yes | ufw enable 
systemctl restart squid.service
service squid status
