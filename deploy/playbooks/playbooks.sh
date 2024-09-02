## Execute Ansible example playbooks

# Firmware Upgrade: 
ansible-playbook -i inventory/inventory.yaml playbooks/updateFirmware.yaml -v

# Startup Config file Update: 
ansible-playbook -i inventory/inventory.yaml playbooks/updateStartup.yaml -v

# Configuration Playbook Examples:
ansible-playbook -i inventory/inventory.yaml playbooks/configExample1.yaml -v
ansible-playbook -i inventory/inventory.yaml playbooks/configExample2.yaml -v
ansible-playbook -i inventory/inventory.yaml playbooks/configExample3.yaml -v

