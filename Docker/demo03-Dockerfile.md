# Dockerfile
## Voorbeeld
```
FROM ubuntu:24.04
MAINTAINER Bart Thonissen "bart.thonissen@thomasmore.be"
RUN apt update && apt install -y nginx
RUN echo 'Hi, I am in your container' >/usr/share/nginx/html/index.html
EXPOSE 80
```
Elke instructies creëert een nieuwe laag, indien succesvol, wordt die laag gecommit en vervolgens de volgende instructie uitgevoerd.

### Bestandsnaam
We maken een bestand met de naam "Dockerfile"

### FROM
De FROM-instructie specificeert een bestaande image waarop de volgende instructies zullen werken; 
deze image wordt de basisimage genoemd.
In ons voorbeeld Dockerfile hebben we de ubuntu:24.04-image gespecificeerd als onze basisimage. 
Deze specificatie bouwt een image op een Ubuntu 24.04 basisbesturingssysteem. 
Net als bij het uitvoeren van een container, moet u altijd specifiek zijn over welke basisimage u precies bouwt.

### MAINTAINER
Vervolgens hebben we de MAINTAINER-instructie gespecificeerd, die Docker vertelt wie de auteur van de image is en wat hun e-mailadres is. Dit is handig om
een eigenaar en contactpersoon voor een image op te geven.

### RUN
De RUN-instructie voert opdrachten uit op de huidige image. De opdrachten in ons voorbeeld: het bijwerken van de geïnstalleerde APT-repositories en het installeren van het nginx-pakket en vervolgens
het aanmaken van het bestand /usr/share/nginx/html/index.html met wat voorbeeldtekst. 
Standaard wordt de RUN-instructie uitgevoerd in een shell met behulp van de commando-wrapper /bin/sh -c.

### EXPOSE
Vervolgens hebben we de EXPOSE-instructie gespecificeerd, die Docker vertelt dat de applicatie in deze container deze specifieke poort op de container zal gebruiken. Dit betekent niet dat je automatisch toegang hebt tot de service die op die poort (in dit geval poort 80) op de container draait. Om beveiligingsredenen opent Docker de poort niet automatisch, maar wacht tot je dit doet wanneer je de container uitvoert met de opdracht docker run. 
We zullen dit zo zien wanneer we een nieuwe container aanmaken vanuit deze image.
Je kunt meerdere EXPOSE-instructies opgeven om meerdere poorten te markeren die moeten worden blootgesteld.
