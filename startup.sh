#!/bin/sh
ip=$(curl -s https://api.ip.sb/ip -A Mozilla)
echo "Now IP address is: $ip"
./zbproxy
