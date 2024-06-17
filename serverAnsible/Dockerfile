# Dockerfile: Defines container specifications to startup and run.
# Author: Arthur Cadore M. Barcella
# Github: arthurcadore
# Capacitação Redes - PV Intelbras
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get clean
RUN apt-get install -y ansible python3 python3-pip openssh-server net-tools

# Install additional dependencies for container
RUN pip3 install textfsm==1.1.0 \
                 scp==0.15.0 \
                 paramiko==3.4.0 \
                 ncclient==0.6.15 \
                 lxml==5.2.2 \
                 ipaddr==2.2.0 \
                 future==1.0.0 \
                 PyNaCl==1.5.0 \
                 bcrypt==4.1.3 \
                 cffi==1.17.0rc1 \
                 pycparser==2.22

# Add startup script to container:
COPY serverAnsible/startup.sh /usr/sbin/startup.sh
RUN chmod +x /usr/sbin/startup.sh

# Starts and Mantain container running:
CMD ["/usr/sbin/startup.sh"]
