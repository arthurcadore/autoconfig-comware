## Execute Ansible example playbooks

# Firmware Upgrade: 
ansible-playbook -i inventory/inventory.yaml playbooks/updateFirmware.yaml

# Startup Config file Update: 
ansible-playbook -i inventory/inventory.yaml playbooks/updateStartup.yaml

# Configuration Playbook Examples:
ansible-playbook -i inventory/inventory.yaml playbooks/configExample1.yaml
ansible-playbook -i inventory/inventory.yaml playbooks/configExample2.yaml
ansible-playbook -i inventory/inventory.yaml playbooks/configExample3.yaml

