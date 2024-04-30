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

### Ansible Running: 

Once the device has be configured by ZTP feature and has opened it's ports to Ansible application, it's start the following procedure to configure the device externally. 

To do that, Ansible copy the file located at `share/configs` to the device and change the `nextstartup` file to be the copied file. 

In the example below, the playbook script is applied to all 16 devices reported on `./share/inventory/hosts.yaml`:

```
ansibleserver  |
ansibleserver  | ###################################################################
ansibleserver  | Execute playbooks script...
ansibleserver  | ###################################################################
ansibleserver  | Cicle N°: 1
ansibleserver  |
ansibleserver  |
ansibleserver  | PLAY [Configuration for H3C devices from Capacita-Rework repository] ***********
ansibleserver  |
ansibleserver  | TASK [Enabling FTP server on the device...] ************************************
ansibleserver  | [WARNING]: Module did not set no_log for password
ansibleserver  | fatal: [sw5]: FAILED! => {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python3"}, "changed": false, "descr": "Error opening connection to device.", "msg": "ConnectionSSHError: host: 10.1.1.5, port: 830 msg: There was an error connecting with SSH. The NETCONF server may be down or refused the connection. The connection may have timed out if the server wasn't reachable."}
ansibleserver  | ...ignoring
ansibleserver  | fatal: [sw4]: FAILED! => {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python3"}, "changed": false, "descr": "Error opening connection to device.", "msg": "ConnectionSSHError: host: 10.1.1.4, port: 830 msg: There was an error connecting with SSH. The NETCONF server may be down or refused the connection. The connection may have timed out if the server wasn't reachable."}
ansibleserver  | ...ignoring
ansibleserver  | fatal: [sw6]: FAILED! => {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python3"}, "changed": false, "descr": "Error opening connection to device.", "msg": "ConnectionSSHError: host: 10.1.1.6, port: 830 msg: There was an error connecting with SSH. The NETCONF server may be down or refused the connection. The connection may have timed out if the server wasn't reachable."}
ansibleserver  | ...ignoring
ansibleserver  | fatal: [sw3]: FAILED! => {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python3"}, "changed": false, "descr": "Error opening connection to device.", "msg": "ConnectionSSHError: host: 10.1.1.3, port: 830 msg: There was an error connecting with SSH. The NETCONF server may be down or refused the connection. The connection may have timed out if the server wasn't reachable."}
ansibleserver  | ...ignoring
ansibleserver  | fatal: [sw7]: FAILED! => {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python3"}, "changed": false, "descr": "Error opening connection to device.", "msg": "ConnectionSSHError: host: 10.1.1.7, port: 830 msg: There was an error connecting with SSH. The NETCONF server may be down or refused the connection. The connection may have timed out if the server wasn't reachable."}
ansibleserver  | ...ignoring
ansibleserver  | fatal: [sw9]: FAILED! => {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python3"}, "changed": false, "descr": "Error opening connection to device.", "msg": "ConnectionSSHError: host: 10.1.1.9, port: 830 msg: There was an error connecting with SSH. The NETCONF server may be down or refused the connection. The connection may have timed out if the server wasn't reachable."}
ansibleserver  | ...ignoring
ansibleserver  | fatal: [sw10]: FAILED! => {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python3"}, "changed": false, "descr": "Error opening connection to device.", "msg": "ConnectionSSHError: host: 10.1.1.10, port: 830 msg: There was an error connecting with SSH. The NETCONF server may be down or refused the connection. The connection may have timed out if the server wasn't reachable."}
ansibleserver  | ...ignoring
ansibleserver  | fatal: [sw11]: FAILED! => {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python3"}, "changed": false, "descr": "Error opening connection to device.", "msg": "ConnectionSSHError: host: 10.1.1.11, port: 830 msg: There was an error connecting with SSH. The NETCONF server may be down or refused the connection. The connection may have timed out if the server wasn't reachable."}
ansibleserver  | ...ignoring
ansibleserver  | fatal: [sw12]: FAILED! => {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python3"}, "changed": false, "descr": "Error opening connection to device.", "msg": "ConnectionSSHError: host: 10.1.1.12, port: 830 msg: There was an error connecting with SSH. The NETCONF server may be down or refused the connection. The connection may have timed out if the server wasn't reachable."}
ansibleserver  | ...ignoring
ansibleserver  | fatal: [sw13]: FAILED! => {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python3"}, "changed": false, "descr": "Error opening connection to device.", "msg": "ConnectionSSHError: host: 10.1.1.13, port: 830 msg: There was an error connecting with SSH. The NETCONF server may be down or refused the connection. The connection may have timed out if the server wasn't reachable."}
ansibleserver  | ...ignoring
ansibleserver  | fatal: [sw14]: FAILED! => {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python3"}, "changed": false, "descr": "Error opening connection to device.", "msg": "ConnectionSSHError: host: 10.1.1.14, port: 830 msg: There was an error connecting with SSH. The NETCONF server may be down or refused the connection. The connection may have timed out if the server wasn't reachable."}
ansibleserver  | ...ignoring
ansibleserver  | changed: [sw2]
ansibleserver  | fatal: [sw15]: FAILED! => {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python3"}, "changed": false, "descr": "Error opening connection to device.", "msg": "ConnectionSSHError: host: 10.1.1.15, port: 830 msg: There was an error connecting with SSH. The NETCONF server may be down or refused the connection. The connection may have timed out if the server wasn't reachable."}
ansibleserver  | ...ignoring
ansibleserver  | fatal: [sw16]: FAILED! => {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python3"}, "changed": false, "descr": "Error opening connection to device.", "msg": "ConnectionSSHError: host: 10.1.1.16, port: 830 msg: There was an error connecting with SSH. The NETCONF server may be down or refused the connection. The connection may have timed out if the server wasn't reachable."}
ansibleserver  | ...ignoring
ansibleserver  | fatal: [sw8]: FAILED! => {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python3"}, "changed": false, "descr": "Error opening connection to device.", "msg": "ConnectionSSHError: host: 10.1.1.8, port: 830 msg: There was an error connecting with SSH. The NETCONF server may be down or refused the connection. The connection may have timed out if the server wasn't reachable."}
ansibleserver  | ...ignoring
ansibleserver  |
ansibleserver  | TASK [Download the configuration content from FTP to the device] ***************
```

Note that all configurations logged as "error" in this scenario are expected. This occurs because the device may not be online when Ansible attempts to access and configure it. These lines represent a connection failure with a device that likely does not exist.

When finished, it will list all changes made on the devices listed on inventory that it could connect to, and after, start a new configuration cicle:

```
ansibleserver  | PLAY RECAP *********************************************************************
ansibleserver  | sw10  : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=4
ansibleserver  | sw11  : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=4
ansibleserver  | sw12  : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=4
ansibleserver  | sw13  : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=4
ansibleserver  | sw14  : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=4
ansibleserver  | sw15  : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=4
ansibleserver  | sw16  : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=4
ansibleserver  | sw2   : ok=5    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=1
ansibleserver  | sw3   : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=4
ansibleserver  | sw4   : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=4
ansibleserver  | sw5   : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=4
ansibleserver  | sw6   : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=4
ansibleserver  | sw7   : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=4
ansibleserver  | sw8   : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=4
ansibleserver  | sw9   : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=4
ansibleserver  |
ansibleserver  | ###################################################################
ansibleserver  | Cicle N°: 2
```


---