# Dockerfile
## Voorbeeld
```
FROM ubuntu:24.04
LABEL version="0.0.1"
LABEL maintainer="bart.thonissen@thomasmore.be"
ENV REFRESHED_AT 2025-10-10
RUN echo 'we are running some # of cool things'
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

### LABEL
Vervolgens hebben we de LABEL-instructie gespecificeerd, die Docker vertelt wie de auteur van de image is en wat hun e-mailadres is. Dit is handig om een eigenaar en contactpersoon voor een image op te geven.

### ENV
De ENV-instructie stelt omgevingsvariabelen in. In dit geval heb ik de ENV-instructie opgegeven om een ​​omgevingsvariabele genaamd REFRESHED_AT in te stellen, die aangeeft wanneer de sjabloon voor het laatst is bijgewerkt. Ten slotte heb ik de opdracht apt update opgegeven in een RUN-instructie. Dit ververst de APT-pakketcache wanneer deze wordt uitgevoerd, zodat de nieuwste pakketten beschikbaar zijn om te installeren.

### RUN
De RUN-instructie voert opdrachten uit op de huidige image. De opdrachten in ons voorbeeld: het bijwerken van de geïnstalleerde APT-repositories en het installeren van het nginx-pakket en vervolgens
het aanmaken van het bestand /usr/share/nginx/html/index.html met wat voorbeeldtekst. 
Standaard wordt de RUN-instructie uitgevoerd in een shell met behulp van de commando-wrapper /bin/sh -c.

### EXPOSE
Vervolgens hebben we de EXPOSE-instructie gespecificeerd, die Docker vertelt dat de applicatie in deze container deze specifieke poort op de container zal gebruiken. Dit betekent niet dat je automatisch toegang hebt tot de service die op die poort (in dit geval poort 80) op de container draait. Om beveiligingsredenen opent Docker de poort niet automatisch, maar wacht tot je dit doet wanneer je de container uitvoert met de opdracht docker run. 
We zullen dit zo zien wanneer we een nieuwe container aanmaken vanuit deze image.
Je kunt meerdere EXPOSE-instructies opgeven om meerdere poorten te markeren die moeten worden blootgesteld.

## Maken van het image
### docker build
We gebruiken de opdracht docker build om onze nieuwe image te bouwen.

```
docker build -t="barttho/demo-image" .
```

### optie -t
We hebben de optie -t opgegeven om onze resulterende image te markeren met een repository en een naam, in dit geval de repository barttho en de imagenaam demo-image. 

Ik raad je sterk aan om je images altijd een naam te geven om ze gemakkelijker te kunnen volgen en beheren.
Je kunt images ook tijdens het bouwproces taggen door de tag na de imagenaam te plaatsen met een dubbele punt.

```
sudo docker build -t="barttho/demo-image:v1" .
```
Images starten en verbinden:
```
docker run -itvd --rm --name demo barttho/demo-image:v1
```
