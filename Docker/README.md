# Docker - Installatie

# Add Docker's official GPG key:  
sudo apt-get update  
sudo apt-get install ca-certificates curl  
sudo install -m 0755 -d /etc/apt/keyrings  
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc  
sudo chmod a+r /etc/apt/keyrings/docker.asc  

# Add the repository to Apt sources:  
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc]   https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null  
sudo apt-get update  

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin   docker-compose-plugin  
sudo systemctl status docker  
sudo systemctl start docker  

# Zonder docker uitvoeren zonder sudo 

Voeg jou gebruiker toe aan de groep Docker:
sudo gpasswd -a $USER docker

Log uit en terug in zodat je lid bent van de groep.
Tenslotte herstart het Docker proces.

sudo systemctl restart docker

# Docker Commando's
docker version

docker pull httpd
docker images
docker run httpd -> zelfde als latest
docker ps
docker stop httpd
docker ps
docker ps -a
docker run httpd

docker run -p 80:80 -d httpd

docker stop IDCONTAINER
docker start IDCONTAINER

docker ps -a -> alle containers gestart of gestopt
docker run -p 6000:80 httpd

docker run -d -p 6000:80 httpd
testen http://127.0.0.1:6000
docker run -d -p 6000:80 httpd:2-alpine
ERROR poort al in gebruik
docker run -d -p 6001:80 httpd:2-alpine
docker run -d --name web-old 6001:80 httpd:2-alpine
docker run -d --name web 6002:80 httpd

Testen en probleem oplossen

docker logs CONTAINERID
docker logs CONTAINERNAAM

docker exec -it CONTAINERID /bin/bash  -> Interactive Terminal
docker exec -it CONTAINERNAME /bin/bash  -> Interactive Terminal

docker exec -it web /bin/bash
docker exec -it web-old /bin/sh -> let op /bin/sh

docker ps -a
docker rm CONTAIJNER_ID
docker images
docker rmi IMAGEID
docker rmi IMAGEID
