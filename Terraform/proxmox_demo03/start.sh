#!/bin/bash
#Ping moet op onze master staan
#apt-get install -y iputils-ping
echo "Start van het script"
echo "Terraform init"
echo "++++++++++++++"
terraform init
echo "++++++++++++++"
echo "terraform apply -auto-approve"
echo "+++++++++++++++++++++++++++++"
terraform apply -auto-approve
echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Wacht tot server antwoorden op Ansible"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
sleep 120
echo "++++++++++++"
echo "Einde pauze"
echo "++++++++++++"
echo "+++++++++++++++++++++++++++++"
echo "Uitvoeren ansible playbook"
echo "+++++++++++++++++++++++++++++"
./run_playbook.sh
echo "+++++++++++++++++++++++++++++"
echo "++++++++++The End++++++++++++"
echo "+++++++++++++++++++++++++++++"
