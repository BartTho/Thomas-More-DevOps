## Basisimage
```
FROM python:latest
```
- Dit geeft aan dat de Docker-image gebaseerd is op de laatste versie van de officiële Python-image.
- Je krijgt dus een Linux-omgeving met Python vooraf geïnstalleerd.

## Metadata
```
LABEL version="0.0.1"
LABEL maintainer="bart.thonissen@thomasmore.be"
```
- LABEL voegt metadata toe aan de image:
- version="0.0.1": Versienummer van deze image.
- maintainer="...": Contactinformatie van de ontwikkelaar/beheerder.

## Bestand kopiëren
```
COPY mijnScript.py /
```
- Kopieert het bestand mijnScript.py vanuit de lokale directory naar de root (/) van de image.
- Dit betekent dat het script beschikbaar is in de container zodra die draait.

## ADD vs COPY
Het belangrijkste verschil is dat ADD meer kan dan alleen COPY.
ADD staat toe dat <src> een URL is.
Verwijzend naar onderstaande opmerkingen stelt de ADD-documentatie het volgende:
Als het een lokaal tar-archief is in een herkend compressieformaat (identity, gzip, bzip2 of xz), dan wordt het uitgepakt als een directory. 
Resources van externe URL's worden niet gedecomprimeerd.

#### Houd er rekening mee dat de Best practices voor het schrijven van Dockerfiles COPY suggereren waar de magie van ADD niet nodig is.

## Uitgeschakelde instructies
```
ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
```
- ENTRYPOINT ["tail"]: De container zou het tail-commando uitvoeren.
- CMD ["-f","/dev/null"]: Zou tail -f /dev/null uitvoeren, wat de container oneindig actief houdt zonder iets te doen.
- Dit is een veelgebruikte truc om een container "levend" te houden voor debugging of handmatige interactie.

## Samenvatting
Deze Dockerfile:
- Bouwt een image op basis van Python.
- Voegt metadata toe.
- Kopieert één scriptbestand naar de container.
- Bevat optionele instructies om de container draaiende te houden zonder actie.

##
Wil je dat het script automatisch wordt uitgevoerd bij het starten van de container? Voeg dan onderstaande regel toe:
```
#ENTRYPOINT ["tail"]
#CMD ["-f","/dev/null"]
CMD ["python", "/mijnScript.py"]
```

## Build en starten
```
docker build -t demo4i .
docker run -itvd --rm --name cdemo4 demo4i
```
