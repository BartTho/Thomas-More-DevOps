## Base image laden
```
FROM ubuntu:latest
```
- Start met de laatste versie van Ubuntu als basisimage.
- Dit is een kale Linux-omgeving zonder extra software.

## Metadata toevoegen
```
LABEL version="0.0.1"
LABEL maintainer="bart.thonissen@thomasmore.be"
```
- Voegt metadata toe aan de image:
- Versienummer.
- Contactgegevens van de ontwikkelaar/beheerder.

## Werkdirectory instellen
```
WORKDIR /var/www/html
```
- Verandert de werkdirectory naar de standaard webroot van NGINX.
- Alle volgende bestandsbewerkingen gebeuren in deze map.

## Webpagina en afbeelding kopiëren
```
COPY index.html index.html
COPY DevOps.png DevOps.png
```
- Kopieert index.html en DevOps.png vanuit de lokale build-context naar /var/www/html in de container.
- Dit zijn de bestanden die NGINX zal serveren.

## Systeem updaten en NGINX installeren
```
RUN apt-get update && apt-get upgrade -y
RUN apt-get install nginx -y
```
- Voert een update en upgrade uit van de Ubuntu-pakketten.
- Installeert NGINX, een populaire en snelle webserver.

## Poort 80 openstellen
```
EXPOSE 80
```
- Geeft aan dat de container poort 80 gebruikt voor HTTP-verkeer.
- Nodig om verbindingen van buitenaf toe te staan.

## NGINX starten
```
CMD ["nginx", "-g", "daemon off;"]
```
- Start NGINX in de foreground (zonder daemon mode).
- Hierdoor blijft de container actief zolang NGINX draait.

## Samenvatting
Deze Dockerfile:
- Bouwt een Ubuntu-gebaseerde container.
- Installeert NGINX.
- Kopieert een webpagina en afbeelding naar de juiste map.
- Stelt poort 80 open.
- Start NGINX automatisch bij het opstarten van de container.

## bouwen en starten
```
docker build -t demo05 .  
docker run -itd --name maggie -p 80:80 demo05
```
