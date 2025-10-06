# demo doel Windows Server
## installatie

### Installatie ssh

In de server manager | Local host | Remote ssh access -> enable

###Windows Server user ansible en groep Open ssh 

Start | Computer management | Grebruikers en groepen | 
-	gebruiker : ansible | stel paswoord in
-	ansible toevoegen aan groepen Administrators en “Open ssh users”
Een folder c:tmp aan maken en authenticated users full control geven.

## Playbook runnen
ansible-playbook -i hosts playbook.yaml
