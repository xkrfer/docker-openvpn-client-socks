#!/bin/sh

echo "nameserver 223.5.5.5" >> /etc/resolv.conf

cd /etc/openvpn && /usr/sbin/openvpn --config *.conf --script-security 2 --up /usr/local/bin/sockd.sh

