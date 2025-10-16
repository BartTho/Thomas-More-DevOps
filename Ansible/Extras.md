### Bekijk informatie over de inventory
```
ansible-inventory --list
ansible-inventory -i hosts--list
```

### Verbose mode activeren
```
ansible-playbook -i hosts -v playbook.yml
```

#### Meer verbose
```
ansible-playbook -i hosts -vv playbook.yml
```
#### Alle info tonen
```
ansible-playbook -i hosts -vvv playbook.yml
```

### De module lijst bekijken en filteren.
```
ansible-doc --list
ansible-doc --list | wc -l
ansible-doc file
ansible-doc -s file
ansible-doc apt
ansible-doc -s apt
ansible-doc -t become -l
ansible-doc -t connection -l
```
