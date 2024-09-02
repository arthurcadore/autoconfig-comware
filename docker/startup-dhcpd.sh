#!/bin/bash
# Author: Arthur Cadore M. Barcella
# Github: arthurcadore

# Script to initialize the DHCP server.

# create the dhcpd.leases file if it does not exist
touch /var/lib/dhcp/dhcpd.leases

# change user of /var/lib/dhcp/dhcpd.leases to root
chown root:root /var/lib/dhcp/dhcpd.leases
# give permissions to the file read and write:
chmod 664 /var/lib/dhcp/dhcpd.leases

# start the DHCP server
dhcpd -d --no-pid

# verify the status of the DHCP server:
ps aux

# verify the status of the DHCP port:
netstat -lnu

# Keep the container running
tail -f /dev/null