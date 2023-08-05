#!/bin/bash

echo "Enter allowed IP address and port (space separated): "
read allowed_ip port

# Install Squid
apt update && apt install squid -y

# Backup the original squid.conf file and create a new one
mv /etc/squid/squid.conf /etc/squid/squid.conf.Original
cd /etc/squid && touch squid.conf

# Append configuration to the squid.conf file
cat << EOF >> /etc/squid/squid.conf
acl localnet src $allowed_ip
http_access allow localnet
http_access deny all
dns_v4_first on
forwarded_for delete
via off
http_port $port
EOF

# Restart Squid service
systemctl restart squid.service

# Check Squid service status
ufw allow $port
ufw allow OpenSSH
yes | ufw enable 
systemctl restart squid.service

echo "Server running at port $port..."