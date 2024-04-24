# Dockerfile: Defines container specifications to startup and run.
# Author: Arthur Cadore M. Barcella
# Github: arthurcadore
# Capacitação Redes - PV Intelbras

# Use the official alpine image as a base:
FROM alpine:3.19.1

# Download and install TFTP server:
RUN apk add --no-cache tftp-hpa

# Create a directory to store the files:
RUN mkdir -p /tftpshare

# Copy the configuration file to the container:
COPY serverTFTP/startup.sh /usr/local/bin/startup.sh

# Set the file as executable:
RUN chmod +x /usr/local/bin/startup.sh

# Start the TFTP server and keep it running:
CMD ["/usr/local/bin/startup.sh"]
