#!/bin/bash

cicle=0
while true; do
    cicle=$((cicle+1))
    echo ""
    echo "###################################################################"
    echo "Cicle N°: $cicle"
    echo "###################################################################"
    echo ""

    # Execute all ansible playbooks...
    ansible-playbook -i inventory/hosts.yaml runner.yaml
    sleep 5
    
done