# Commando's

## Kluis aanmaken
ansible-vault create vars/mijn_kluis.yml  
eventueel -> sudo apt install vim  

Gegevens zijn onleesbaar  
cat vars/mijn_kluis.yml   

## Kluis bekijken en bewerken  
ansible-vault view vars/mijn_kluis.yml  
ansible-vault edit vars/mijn_kluis.yml  

## Kluis gebruiken
playbook wachtwoord ->   
    - name: Print een geheime boodschap  
      ansible.builtin.debug:  
        var: mijn_geheime_boodschap  

hosts ->  
    ansible_password = {{paswoord}}  

## Ansible commando aanpassen
ansible-playbook -i hosts -e @vars/mijn_kluis.yml playbook2.yaml --ask-vault-pass

## Encrypting the vault with base64 generated password

1) genereer willekeurig paswoord  
openssl rand -base64 2048 > vars/mijn_paswoord.pass

2) Maak een nieuwe kluis ùet dat paswoord  
ansible-vault create vars/mijn_kluis2.yml --vault-password-file=vars/mijn_paswoord.pass

3) Bekijk de inhoud met het super pâswoord  
ansible-vault view vars/mijn_kluis2.yml --vault-password-file=vars/mijn_paswoord.pass

4) Gebruik het paswoord bestand bij ansible playbook  
ansible-playbook -i hosts playbook2.yaml -e @vars/mijn_kluis2.yml --vault-password-file=vars/mijn_paswoord.pass
