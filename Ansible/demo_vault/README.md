# Commando's

## Kluis aanmaken
```
ansible-vault create vars/mijn_kluis.yml
```
Vi installeren:
```
sudo apt install vim
```
Vi of vim kent een editeer mode en een commando mode. Bij de start bevinden we ons in commando mode.
We drukken op a (appent) om naar de editeer mode te gaan en kunnen nu onze tekst toevoegen.
```
mijn_paswoord: Top.Secret
mijn_geheim: "Dit is een super geheime boodschap!!"
```
Na het toevoegen van de tekst gaan we terug naar commando mode door op "Esc" te drukken.
We zijn nu terug in commando mode en geven het commando wq! 
- w = write
- q = quit
- ! forceren (altijd doen)
  
Gegevens zijn onleesbaar  
```
cat vars/mijn_kluis.yml
```

## Kluis bekijken en bewerken  
```
ansible-vault view vars/mijn_kluis.yml  
ansible-vault edit vars/mijn_kluis.yml  
```
## Kluis gebruiken
playbook wachtwoord ->   
```
- name: boodschap afdrukken
  hosts: windows
  gather_facts: no
  tasks:
    - name: Print een boodschap
      ansible.builtin.debug:
        var: mijn_geheim
```
hosts ->  
```
    ansible_password = {{paswoord}}  
```
## Ansible commando aanpassen
```
ansible-playbook -i hosts -e @vars/mijn_kluis.yml playbook2.yaml --ask-vault-pass
```
## De kluis versleutelen met een base64 gegenereerd paswoord

1) genereer willekeurig paswoord  
```
openssl rand -base64 2048 > vars/mijn_paswoord.pass
```
3) Maak een nieuwe kluis ùet dat paswoord  
```
ansible-vault create vars/mijn_kluis2.yml --vault-password-file=vars/mijn_paswoord.pass
```
4) Bekijk de inhoud met het super pâswoord
```
ansible-vault view vars/mijn_kluis2.yml --vault-password-file=vars/mijn_paswoord.pass
```
6) Gebruik het paswoord bestand bij ansible playbook
```
ansible-playbook -i hosts playbook2.yaml -e @vars/mijn_kluis2.yml --vault-password-file=vars/mijn_paswoord.pass
```
