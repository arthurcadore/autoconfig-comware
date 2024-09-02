# Appliance for AutoDeploy + Configuration + Update of Intelbras Comware devices

### This repository implements the [ansible-comware](https://hub.docker.com/repository/docker/arthurcadore/ansible-comware) images avaiable on DockerHub.

Prerequisites
Before you begin, ensure you have the following packages installed on your system:

- Git version 2.34.1
- Docker version 24.0.6, build ed223bc
- Docker Compose version v2.21.0

---
### Getting Started:

First, copy the line below and paste on your prompt to clone the repository:

```
git clone https://github.com/arthurcadore/autoconfig-comware
```
If you don't have installed the package Git yet, do it before try to clone the respository!

Navigate to the project directory:

```
cd ./autoconfig-comware
```

If you don't have Docker (and Docker-compose) installed on your system yet, it can be installed by run the following commands (Script for Ubuntu 22.04): 

```
./installDocker.sh
```

**If you had to install docker, please remember to reboot you machine to grant user privileges for docker application.** 

In sequence, configure the environment files for the application container, you can do this by edditing the following files: 

#### config/hosts -> add new hosts domain names:
```conf
10.1.1.1 sw1
10.1.1.2 sw2
10.1.1.3 sw3
```

Note: by default it comes with the custom domains above, remove it if you have an DNS server for domain resolution.

#### config/dhcpd.conf

In sequence, configure the parameters for DHCP server deploy the ZTP on the devices:

```conf
option domain-name "capacitacao.intelbras.com.br";
option domain-name-servers 10.1.1.253;
option routers 10.1.1.254;
default-lease-time 300;
max-lease-time 600;

option tftp-server-address 10.1.1.253;
option bootfile-name "device.cfg";

subnet 10.1.1.0 netmask 255.255.255.0 {
  range 10.1.1.2 10.1.1.16;
  option routers 10.1.1.254;
  option subnet-mask 255.255.255.0;
  default-lease-time 300;
  max-lease-time 600;
  option subnet-mask 255.255.255.0;
  option broadcast-address 255.255.255.0;
  option domain-name "capacitacao.intelbras.com.br";
}
```

#### deploy/playbooks/ -> add the playbook configuration you want to be applied on device, like the configuration below:
```yaml
---
- name: First Configuration Example - Intelbras Devices
  hosts: all
  gather_facts: no
  connection: local

  tasks:
    - name: Creating VLAN 123 on the device
      comware_vlan: 
        username: "{{ username }}" 
        password: "{{ password }}" 
        hostname: "{{ inventory_hostname }}"
        vlanid: "123" 
        name: "VLAN123" 
        descr: "VLAN-123-DATA"
        state: "present"

    - name: Saving the configuration on the device...
      comware_save: 
        username: "{{ username }}" 
        password: "{{ password }}" 
        hostname: "{{ inventory_hostname }}"
```
#### you can add any other playbook archives if you want to the directory `deploy/playbooks`, but after remember to include it into `playbooks.sh` script for execution.  

#### /deploy/inventory/ -> configure the devices paramters as user, password and other parameters. 
```yaml
all:
  children:
    switches:
      hosts:
        sw1:
          ansible_host: 10.100.29.123
          username: ansible
          password: capacita#123
        sw2:
          ansible_host: 10.100.29.124
          username: ansible2
          password: capacita#1232
        sw3:
          ansible_host: 10.100.29.125
          username: ansible3
          password: capacita#1233
```
#### you can add any other hosts archives if you want to the directory `deploy/inventory`. 


### Start Application's Container: 
Run the command below to start docker-compose file: 

```
docker compose up & 
```
The "&" character creates a process id for the command inputed in, with means that the container will not stop when you close the terminal. 

---

### Using Application:

Once the containers are running, you the device can get an IP Address with the options for download a boot-file from TFTP server, this process is called ZTP (Zero Touch Provisioning). After it, the ansible can access the device by the configurations that was applied on the device. 

Once the device is accessed from Ansible, it will apply the playbooks that are included on the `playbooks.sh` script, such as Upgrade the firmware, configurate other parameters, update the default startup file. 
 
---

---
### Configuring connection to the device manually: 

The following tutorial is used for debugging porpuses, do not use it on production: 

First, access the python3 prompt using `python3` command:
```
[root@demo]# python3
Python 3.10.12 (main, Nov 20 2023, 14:14:05) [GCC 11.4.0] on linux
```

In python prompt, import comware 7 ansible library using the command below:  
```
>>> from pycw7.comware import COM7
```

In sequence, create an vector with all parameters for login on the device, as displayed below: 
```
>>> accessvalues = dict(host='sw1', username='ansible', password='capacita#123', port=830)
```

Once the vector is created, create an object `device` using the COM7 library passing the access vector on:  
```
>>> device = COM7(**accessvalues)
```

In sequence, open a communication channel with the device using: 
```
>>> device.open()
<ncclient.manager.Manager object at 0x7f3ed5953150>
```

#### To test it, we can get a vlan configuration using `vlan.comware` submodule: 

First, we need to import the feature to the prompt line, to do that, we can use: 
```
>>> from pycw7.features.vlan import Vlan
```

In sequence, with `Vlan` feature loaded, we'll pass the device and VID agrs as parameters to the feature function: 
```
>>> vlan20 = Vlan(device,'20') 
```

Finishing, we'll call the function `get_config()`, to verify the VID20 on the device:  
```
>>> vlan20.get_config()
```

The result for this call is displayed below: 
```
{'vlanid': '20', 'name': 'VLAN20', 'descr': 'VLAN-20-MANAGE'}
```

--- 
### Stop Container: 
To stop the running container, use the following command:

```
docker-compose down
```

This command stops and removes the containers, networks, defined in the docker-compose.yml file.

--- 

# References/Libs used: 

[Base image (ubuntu:22.04) used ](https://hub.docker.com/_/ubuntu)

[Comware HPE lib used](https://github.com/H3C/pycw7-ansible)


