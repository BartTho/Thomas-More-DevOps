 ``` 
docker pull httpd
docker images
docker run httpd  -> zelfde als latest
docker run --name web -d httpd -> detached mode
docker ps
docker ps -a -> alle containers gestart of gestopt

docker run -d --name web2 httpd:2-alpine
docker images
docker ps

docker stop IDCONTAINER of web2
docker ps
docker ps -a
docker start IDCONTAINER
docker stop web2
docker rm web2
docker image ls 
of docker images
docker image rm httpd:2-alpine 
of docker rmi httpd:2-alpine

docker stop web
docker rm web
docker run -d --name web8080 -p 8080:80 httpd
testen http://SERVERIP:8080
docker run -d --name web2 -p 8080:80 httpd
ERROR poort al in gebruik
docker run -d --name web8081 -p 8081:80 httpd

Testen en probleem oplossen

docker inspect web8080
docker inspect httpd

docker logs CONTAINERID
docker logs CONTAINERNAAM

docker exec -it CONTAINERID /bin/bash  -> Interactive Terminal
docker exec -it CONTAINERNAME /bin/bash  -> Interactive Terminal

apt update
apt install nano
nano /usr/local/apache2/htdocs/index.html
TEST : http://SERVER-IP:8080
exit
 ``` 
