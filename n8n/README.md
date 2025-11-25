## Installtie n8n Self-hosting
### Stap 1 : Installatie nodejs en npm
We werken het systeem bij om ervoor te zorgen dat het de nieuwste beveiligingspatches en updates heeft.
Zodra dit is voltooid, is uw server gereed voor de installatie van nodejs en npm.
```
sudo apt update && sudo apt upgrade -y
sudo apt install nodejs -y
sudo apt install npm -y
```
### Stap 2: Controleer de installatie:
We testen de installatie:
```
node --version
npm --version
```
### Stap 3: n8n installeren
We installeren n8n via npm
```
sudo npm install n8n -g
```
### Stap 4: Als nodig de firewall instellen

Installeer en configureer de UFW-firewall
Houd alleen de benodigde poorten open: SSH (22), HTTP (80), HTTPS (443).

Installeer UFW en configureer de firewall als volgt:
```
sudo apt install ufw -y
sudo ufw allow 22 # SSH
sudo ufw allow 80 # HTTP
sudo ufw allow 443 # HTTPS
sudo ufw enable
```
Controleer de configuratie van je firewall:
```
sudo ufw status verbose
```

### Stap 5: Starten van n8n
Voer het commando n8n uit, Das alles.
```
n8n
```
