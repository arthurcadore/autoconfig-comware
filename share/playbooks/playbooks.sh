#!/bin/bash

cicle=0

while true; do
    cicle=$((cicle+1))
    echo "##################################"
    echo "Cicle N°: $cicle"
    echo ""

    ## Execute o playbook de exemplo do Ansible
    ansible-playbook -i inventory/hosts.yaml runner.yaml
    ## Aguarde um tempo antes de iniciar a próxima execução (opcional)
    sleep 5
done