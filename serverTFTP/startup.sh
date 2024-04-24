#!/bin/ash
# Author: Arthur Cadore M. Barcella
# Github: arthurcadore

# Script to initialize the TFTP server.

# Start the TFTP server and keep it running sharing the directory tftpshare.
# The TFTP is listening on port 69 of any interface

# Start the TFTP server
in.tftpd -l -s /tftpshare -a 0.0.0.0:69 &

# Verify the status of the TFTP server:
ps aux

# Verify the status of the TFTP port:
netstat -lnu

# Keep the container running
tail -f /dev/null
