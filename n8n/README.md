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

## Docker Compose

```
version: '3.8'

services:
  n8n:
    image: n8nio/n8n:latest
    container_name: n8n
    restart: unless-stopped
    ports:
      - "5678:5678"
    environment:
      - N8N_HOST=localhost
      - N8N_PORT=5678
      - N8N_PROTOCOL=http
      - NODE_ENV=production
      - WEBHOOK_URL=http://localhost:5678/
      - GENERIC_TIMEZONE=Europe/Amsterdam
    volumes:
      - ./n8n_data:/home/node/.n8n
      - ./local_files:/files
    networks:
      - n8n-network

  # Optioneel: PostgreSQL voor betere performance
  postgres:
    image: postgres:15
    container_name: n8n-postgres
    restart: unless-stopped
    environment:
      - POSTGRES_USER=n8n
      - POSTGRES_PASSWORD=n8n
      - POSTGRES_DB=n8n
    volumes:
      - ./postgres_data:/var/lib/postgresql/data
    networks:
      - n8n-network

networks:
  n8n-network:
    driver: bridge
```
