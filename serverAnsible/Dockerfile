# Dockerfile: Defines container specifications to startup and run.
# Author: Arthur Cadore M. Barcella
# Github: arthurcadore
# Capacitação Redes - PV Intelbras
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get clean
RUN apt-get install -y ansible python3 python3-pip openssh-server net-tools

# Add startup script to container:
COPY serverAnsible/startup.sh /usr/sbin/startup.sh
RUN chmod +x /usr/sbin/startup.sh

# Starts and Mantain container running:
CMD ["/usr/sbin/startup.sh"]
