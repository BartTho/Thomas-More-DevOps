# Commando's

## Het paswoord opgeven.

ansible-playbook -i hosts -e @vars/mijn_kluis.yml playbook2.yaml 

ansible-playbook -i hosts -e @vars/mijn_kluis.yml playbook2.yaml --ask-vault-pass

## Encrypting the vault with base64 generated password

1) genereer willekeurig paswoord  
penssl rand -base64 2048 > ansible-vault.pass

2) Maak een nieuwe kluis ùet dat paswoord  
ansible-vault create vars/mijn_kluis2.yml --vault-password-file=ansible-vault.pass



3) Bekijk de inhoud met het super pâswoord  
ansible-vault view vars/mijn_kluis2.yml --vault-password-file=ansible-vault.pa

4) Gebruik het paswoord bestand bij ansible playbook  
ansible-playbook -i hosts playbook2.yml -e @vars/mijn_kluis.yml --vault-password-file=ansible-vault.pass
