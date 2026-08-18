# Docker
## Opdrachten
### Basisinformatie over docker weergeven:
```bash
docker info
```
### Docker-containers weergeven die worden uitgevoerd:
```bash
docker ps
```
### Zoeken naar een docker-container in de docker-hub:
```bash
docker search <zoekterm>
```

### Een containerimage ophalen op basis van Ubuntu uit de docker-hub:
```bash
docker pull ubuntu:latest
```

### Een docker-container uitvoeren die is gebaseerd op Ubuntu en deze verwijderen wanneer deze is voltooid:

```bash
docker run --rm ubuntu:latest /bin/bash
```

### Een docker-container uitvoeren met een interactieve shell:

```bash
docker run -it ubuntu:latest /bin/bash
```

### Een docker-container uitvoeren als een daemon:

```bash
docker run -it ubuntu:latest /bin/bash
```

### Koppel aan een container die al draait:

```bash
docker attach <container>
```

### Koppel los van een draaiende container"

Druk op CTRL+P CTRL+Q

### Stop een gedaemoniseerde container:

```bash
docker stop <container>
```

### Bekijk wat er gebeurt in een gedaemoniseerde container:

```bash
docker logs <container>
```

### Volg de uitvoer van een gedaemoniseerde container:

```bash
docker logs -f <container>
```

### Geef de laatste 10 regels van de uitvoer van een gedaemoniseerde container weer:

```bash
docker logs --tail 10 <container>
```

### Geef de uitvoer van een daemonized container met tijdstempels:

```bash
docker logs --ft <container>
```

### Voer een opdracht uit in een container:

```bash
docker exec -it <container> <opdracht>
```

### Voeg een nieuwe achtergrondtaak toe aan een actieve container:

```bash
docker exec -d daemon_dave touch /etc/new_config_file
```

### Voer een opdracht uit tegen een docker-image:

```bash
docker run ubuntu:latest /bin/echo "Hello World"
```

### De processen van een container inspecteren:

```bash
docker top <container>
```

### Verwijder alle eerder uitgevoerde en gestopte containers:

```bash
docker rm `docker ps -a -q`
```

### Verwijder alles containers:

```bash
docker rm `docker ps -a -q` of docker rm $(docker ps -a -q)
```

### Alle afbeeldingen verwijderen:

```bash
docker rmi $(docker imagesx -q)
```

### Een afbeelding verwijderen:

```bash
docker rmi <imageID>
```
