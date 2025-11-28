## OPTIE 1 Installtie n8n Self-hosting installatie op de server
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

### Stap 5: Update Nodejs naar versie >=20.19 <= 24.x
n8n heeft een node.js versie nodig tussen 20.19 en 24. Door de standaard installatie word er een oudere versie geïnstalleerd en deze is niet compatibel met n8n. We doen een update met de volgende 3 commando's.

```
sudo npm cache clean -f 
sudo npm install -g n 
sudo n stable
```
### Stap 6: Starten van n8n
Als we n8n nu zouden starten krijgen we een melding van een secure cookie. We moeten eigenlijk https gebruiken.
Deze melding kunnen we uitschakelen door volgend comando

```
export N8N_SECURE_COOKIE=false
```

### Stap 7: Starten van n8n
Voer het commando n8n uit, Das alles.
```
n8n
```

## OPTIE 1 Installtie n8n Self-hosting in een docker container
Deze optie is eenvoudiger, maar het is moeilijker om bestanden die n8n gebruikt te beheren.

### Stap 1: installeer docker
Voor de installtie verwijs ik naar de les van docker.

### Stap 2: Docker Compose
Maak een nieuw bestand met de naam "compose.yml" 
```
nano compose.yml
```

Voeg onderstaande code toe aan het bestand en sla het bestand op (ctrl+o, ctrl+x)
--- Opmerking: ik heb de parameter N8N_SECURE_COOKIE=false gezet om te kunnen werken met http.

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
      - GENERIC_TIMEZONE=Europe/Brussels
      - N8N_SECURE_COOKIE=false
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
### Stap 2: Docker Compose up
Voer het onderstaande commando uit om n8n te starten, het punt geeft aan dat het compose bestand in deze map staat:
```
docker compose up .
```
