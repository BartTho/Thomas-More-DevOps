#We laden het base images ubuntu
FROM ubuntu:latest

#We definieren enkele labels
LABEL version="0.0.1"
LABEL maintainer="bart.thonissen@thomasmore.be"

# Voeg mijn eigen webpagina toe
WORKDIR /var/www/html

COPY index.html index.html
COPY DevOps.png DevOps.png

#we voeren de updates uit en installeren nginx
RUN apt-get update && apt-get upgrade -y
RUN apt-get install nginx -y

#we maken poort 80 beschikbaar voor export
EXPOSE 80

#we starten nginx automatisch
CMD ["nginx", "-g", "daemon off;"]
