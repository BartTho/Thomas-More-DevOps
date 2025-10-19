## Algemene structuur
YAML

```
services:  
  ollama:    
  ...  
  open-webui:    
  ...
  volumes:  
    ollama: {}  
    open-webui: {}
```

Er zijn twee services gedefinieerd onder services, en twee volumes onder volumes voor persistente opslag.

## Service: ollama
```
ollama:
  volumes:
    - ollama:/root/.ollama
  container_name: ollama
  pull_policy: always
  tty: true
  restart: unless-stopped
  image: ollama/ollama:${OLLAMA_DOCKER_TAG-latest}

```
### Wat doet deze service?

Doel: Draait de Ollama backend, een AI-modelserver (bijv. voor LLMs zoals LLaMA, Mistral, etc.).
volumes: Mount een volume genaamd ollama naar /root/.ollama in de container. Dit zorgt ervoor dat modeldata of configuraties bewaard blijven.
container_name: De container krijgt de naam ollama.
pull_policy: always: Docker probeert altijd de nieuwste versie van het image te downloaden bij het starten.
tty: true: Zorgt ervoor dat de container een terminal sessie openhoudt (handig voor debugging).
restart: unless-stopped: Container wordt automatisch opnieuw gestart tenzij je hem expliciet stopt.
image: Gebruikt het image ollama/ollama, met een optionele tag via de omgevingsvariabele OLLAMA_DOCKER_TAG. Als die niet is gezet, wordt latest gebruikt.

## Service: open-webui
```
open-webui:
  build:
    context: .
    args:
      OLLAMA_BASE_URL: '/ollama'
    dockerfile: Dockerfile
  image: ghcr.io/open-webui/open-webui:${WEBUI_DOCKER_TAG-main}
  container_name: open-webui
  volumes:
    - open-webui:/app/backend/data
  depends_on:
    - ollama
  ports:
    - ${OPEN_WEBUI_PORT-3000}:8080
  environment:
    - 'OLLAMA_BASE_URL=http://ollama:11434'
    - 'WEBUI_SECRET_KEY='
  extra_hosts:
    - host.docker.internal:host-gateway
  restart: unless-stopped
```
### Wat doet deze service?

Doel: Draait een webinterface voor interactie met Ollama.
build: Bouwt een Docker image vanuit de huidige directory (.), met een argument OLLAMA_BASE_URL dat waarschijnlijk gebruikt wordt in de frontend/backend.
image: Alternatief wordt een image gebruikt van GitHub Container Registry, met een optionele tag via WEBUI_DOCKER_TAG (default: main).
volumes: Mount een volume open-webui naar /app/backend/data voor persistente opslag van gebruikersdata of instellingen.
depends_on: Zorgt ervoor dat ollama eerst wordt gestart.
ports: Maakt poort 8080 van de container beschikbaar op poort 3000 van de host (of een andere poort via OPEN_WEBUI_PORT).
environment:

OLLAMA_BASE_URL: Verwijst naar de ollama container via zijn netwerknaam en poort 11434.
WEBUI_SECRET_KEY: Leeg gelaten, maar kan gebruikt worden voor authenticatie of sessiebeheer.


extra_hosts: Maakt host.docker.internal beschikbaar binnen de container, wat handig is voor toegang tot de hostmachine.
restart: Zelfde als bij ollama.

## Volumes
```
volumes:
  ollama: {}
  open-webui: {}
```
Deze volumes zorgen ervoor dat data van beide containers behouden blijft, zelfs als de containers opnieuw worden opgestart of verwijderd.

## Samengevat
Deze docker-compose.yml:

- Start twee containers: één voor de AI-backend (ollama) en één voor de webinterface (open-webui).
- Zorgt voor persistente opslag via volumes.
- Laat de webinterface communiceren met de backend via een intern Docker-netwerk.
- Is flexibel door gebruik van omgevingsvariabelen voor versies en poorten.

```
docker compose up -d
```
