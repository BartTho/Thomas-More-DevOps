# Docker - Installatie

# Add Docker's official GPG key:  
```
# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
``` 

# Add the repository to Apt sources:  
 ```
# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update
``` 

``` 
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin  
sudo systemctl status docker  
sudo systemctl start docker  
```
# Docker uitvoeren zonder sudo 

Voeg jou gebruiker toe aan de groep Docker:
```
sudo usermod -aG docker $USER
``` 

Log uit en terug in zodat je lid bent van de groep.
Tenslotte herstart het Docker proces.
``` 
sudo systemctl restart docker
``` 
# Docker Commando's
``` 
docker version
``` 
