# Cursus DevOps – Deel Ansible

## Voorbereiding installatie

### Ansible Controller
Als Controller voor Ansible gebruiken we onze DevOps-server.

Om snel meerdere servers beschikbaar te maken, maken we linked clones.
Na het klonen stellen we op elke server de hostnaam in en passen we de machine-id aan.
Deze stappen voeren we uit op alle servers die we willen beheren.

- sudo hostnamectl set-hostname ansible1
- sudo nano /etc/hosts
- sudo rm /etc/machine-id
- sudo systemd-machine-id-setup


### Aanmaken gebruiker en installatie Ansible

Op alle servers maken we een aparte gebruiker ansible aan.
Deze gebruiker wordt gebruikt om Ansible-commando’s uit te voeren.
Omdat Ansible beheertaken moet kunnen uitvoeren, geven we de gebruiker sudo-rechten, 
zodat hij opdrachten met administratorrechten kan uitvoeren, zoals het installeren van software.

Gebruiker aanmaken (op alle servers, inclusief de Controller/DevOps-server)

- sudo useradd -m -G sudo -s /bin/bash ansible
- sudo passwd ansible

## Installatie van Ansible

### Ansible installeren we uitsluitend op de Controller (DevOps-server).

De installatie gebeurt met behulp van het pakketbeheersysteem:  
Debian/Ubuntu:   
   sudo apt update && sudo apt upgrade -y  
   sudo apt install software-properties-common  
   sudo add-apt-repository --yes --update ppa:ansible/ansible  
   sudo apt update  
   sudo apt install ansible  

## Configuratiebestand aanpassen

### Nade installatie passen we het configuratiebestand /etc/ansible/hosts aan.

BESTAND /etc/ansible/hosts

  [groen]  
  IP SERVER 1  
  IP SERVER 2  
  
  [blauw]  
  IP SERVER 3  
  
  [all:vars]  
  ansible_connection=ssh  
  ansible_user=ansible  
  ansible_ssh_pass=Top.Secret  

### Aanpassen config-bestand:
open bestand /etc/ansible/ansible.cfg

   [defaults]  
   host_key_checking = False  

### Python3 waarschuwing

Wanneer er een waarschuwing verschijnt met betrekking tot Python, kan dit worden opgelost door de volgende regel toe te voegen in /etc/ansible/hosts:

  [all:vars]  
    ansible_connection=ssh  
    ansible_user=ansible  
    ansible_ssh_pass=Top.Secret  
    ansible_python_interpreter=/usr/bin/python3  
    
### Als je admin rechten nodig hebt in een ansible script. 

Aanpassen : /etc/ansible/hosts  
  [all:vars]  
    ansible_connection=ssh  
    ansible_user=ansible  
    ansible_ssh_pass=Top.Secret  
    ansible_become_password=Top.Secret  
    ansible_python_interpreter=/usr/bin/python3  
    ansible_become_password=Top.Secret  

In het playbook : toevoegen van become: yes

## Beveiliging via SSH-keys

Om de verbindingen te beveiligen, maken we gebruik van een SSH-sleutel in plaats van wachtwoorden.

### Op Controller 
•	su - ansible  
•	ssh-keygen  
•	ssh-copy-id ansible@ansible1 (IP-ADDRESS)  
•	ssh-copy-id ansible@ansible2 (IP-ADDRESS)  
•	ssh-copy-id ansible@ansible3 (IP-ADDRESS)  

### /etc/ansible/hosts

Om ervoor te zorgen dat Ansible deze sleutel gebruikt, voegen we de juiste instellingen toe in het bestand /etc/ansible/hosts.
  [all:vars]  
    ansible_connection=ssh  
    ansible_user=ansible  
    ansible_ssh_pass=Top.Secret  
    # ansible_become_password=Top.Secret  -> deze regel mag wag of we maken er commentaar van door # ervoor te zetten.  
    ansible_private_key_file=/home/ansible/.ssh/id_ed25519  
    ansible_python_interpreter=/usr/bin/python3  
    ansible_become_password=Top.Secret  

## Gebruik van Ansible Vault om uw paswoorden veilig op te slaan.
Voor betere veiligheid kan je jou paswoorden en gevoelige data incripteren via Ansible Vault:

Maak een geincrpteerd bestand aan:  

   ansible-vault create secrets.yml  

Voeg je gebruiker en paswoord toe:

   ansible_user: ansible
   ansible_password: Top.Secret

Refereer naar deze bruiker in ons playbook.yaml

   vars_files:
      - secrets.yml

Voer het playbook nu uit, het maakt nu gebruik van de kluis.

ansible-playbook myplaybook.yml --ask-vault-pass  
