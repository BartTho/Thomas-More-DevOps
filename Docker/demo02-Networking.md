```
ip add
- docker0
docker network ls of docker network list
```

# 1-NETWERKEN IN DOCKER - Bridge  
```
docker run -itd --rm --name homer busybox  
docker run -itd --rm --name bart busybox  
docker run -itd --rm --name lisa nginx

bridge link
docker inspect bridge
docker network ls
docker exec -it homer sh
  ping 172.17.0.3
  ping www.google.be
```

# 2-NETWERKEN IN DOCKER - Bridge
Voordeel : Eenvoudig
Nadeel : Geen isolatie
```
docker stop lisa
docker run -itd --rm -p 80:80 --name lisa nginx

bridge link
docker inspect bridge
docker network ls
```
# 3-Zelf netwerk maken: Custom Bridge
Voordeel : BESTE OPTIE
```
docker network create mijn_bridge

bridge link
docker inspect mijn_bridge
docker network ls

docker run -itd --rm --network mijn_bridge --name marge busybox
```
# 4-HOST
Voordeel : Snelste
Nadeel : 
- Als een container poort 80 gebruikt kunnen we geen 2de container in het host-netwerk toevoegen die ook poort 80 gebruikt!!
- Geen isolatie
```
docker network ls
docker run -itd --rm --network host --name marge httpd
```
# 5-IPvlan
NADEEL, Geen controle over het gekregen IP-adres !!!
```
docker network create -d ipvlan --subnet=192.168.1.0/24 --gateway=192.168.1.1 -o ipvlan_mode_l2 -o parent=ens160 mijn_ipvlan
docker network ls
docker inspect mijn_ipvlan
docker inspect maggie
docker run -itd --rm --name maggie --network mijn_ipvlan-net httpd
```
