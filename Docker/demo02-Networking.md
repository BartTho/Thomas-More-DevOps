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
```
docker stop lisa
docker run -itd --rm -p 80:80 --name lisa nginx

bridge link
docker inspect bridge
docker network ls
```
# 3-Zelf netwerk maken: Custom Bridge

```
docker network create mijn_bridge

bridge link
docker inspect mijn_bridge
docker network ls

docker run -itd --rm --network mijn_bridge --name marge busybox
```
