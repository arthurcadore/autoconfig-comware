# AutoConfig Appliance for Comware7 H3C Devices

#### This repository implements ZTP + Ansible Appliances to upload a default configuration file to the device and provisioning it into Ansible for custom configurations. 

---
Prerequisites Before you begin, ensure you have the following packages installed on your system:

Git version 2.34.1
Docker version 24.0.6, build ed223bc
Docker Compose version v2.21.0

### Getting Started: 

First, copy the line below and paste on your prompt to clone the repository:

```
git clone https://github.com/arthurcadore/capacita-puppet
```

If you don't have installed the package Git yet, do it before try to clone the respository!

Navigate to the project directory:

```
cd ./capacita-puppet
```

If you don't have Docker (and Docker-compose) installed on your system yet, it can be installed by run the following commands (Script for Ubuntu 22.04):

```
./docker/installDocker.sh
```

**If you had to install docker, please remember to reboot you machine to grant user privileges for docker application.**

In sequence, configure the environment archives for the application containers, you can do this by edditing the files in /share/ directory:
```
share/configs/ -> Add new configuration files that the devices will receive using FTP. 
inventory/hosts.yaml -> Reconfigure the inventory variables to list the devices that will be configured.
config/hosts -> Add the devices name resolution (FQDN) to ansible can resolve them. 
playbooks/switch.yaml -> Change the playbook actions that ansible will perform. 
```

You also can to configure the server parameters, you can do this by edditing the files below (not necessary if network IP range don't change): 
```
serverDHCP/dhcpd.conf -> Update the DHCP parameters to your custom topology
```

### Start Application's Container:

Run the command below to start docker-compose file:

```
docker compose up & 
```
The "&" character creates a process id for the command inputed in, with means that the container will not stop when you close the terminal.
---

