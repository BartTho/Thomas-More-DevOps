# Inleiding
We installeren 3 componenten
- Grafana: voor visualisatie
- Prometheus: Voor het verwerken van de verzamelde data
- Node Exporter: voor het verzamelen van data

# Installatie Node Exporter

Wanneer je net begint met Prometheus om je linux resources te monitoren is het goed om eerst de basics op te zetten. 
De stappen hieronder helpen je om deze basics op te zetten. 
Er wordt van een specifieke versie uitgegaan voor het gemak, maar je kan natuurlijk de laatst beschikbare 
versie gebruiken om bij te blijven.

## Downloaden en uitpakken

Volg de volgende stappen om Node Exporter te installeren:
- [ ] Haal de laatste versie op;
- [ ] Pak 'm uit.
- [ ] Maak een nieuwe groep aan voor de aan te maken gebruiker;
- [ ] Voeg een nieuwe gebruiker toe, ken deze toe aan de zojuist gemaakte groep. Het aanmaken van een userdirectory is niet nodig voor deze gebruiker;
- [ ] Verplaats de gedownloade binary naar de juiste directory en geef het de juiste rechten

```
wget https://github.com/prometheus/node_exporter/releases/download/v1.9.1/node_exporter-1.9.1.linux-amd64.tar.gz
tar xvfz node_exporter-1.9.1.linux-amd64.tar.gz
sudo groupadd -f node_exporter
sudo useradd -g node_exporter --no-create-home --shell /bin/false node_exporter
cd node_exporter-1.9.1.linux-amd64/
sudo mv node_exporter /usr/bin/
sudo chown node_exporter:node_exporter /usr/bin/node_exporter
```
## Service aanmaken en starten

- [ ] Maak vervolgens een nieuw bestand aan voor de service.
- [ ] Geef het een inhoud
- [ ] Start de service
```
sudo nano /usr/lib/systemd/system/node_exporter.service
```
Geef het de volgende inhoud:

```
[Unit]
Description=Node Exporter
Documentation=https://prometheus.io/docs/guides/node-exporter/
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
Restart=on-failure
ExecStart=/usr/bin/node_exporter \
  --web.listen-address=:9100

[Install]
WantedBy=multi-user.target
```
## Node Exporter service activeren en starten 
Geef het de juiste rechten en start vervolgens de service, check of hij werkt en zorg dat hij automatisch start bij een eventuele reboot.
```
sudo chmod 664 /usr/lib/systemd/system/node_exporter.service
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl status node_exporter
sudo systemctl enable node_exporter.service
```
## Node Exporter controleren
Wanneer de service actief is kan je controleren of hij toegankelijk is door de url van de host te checken op, 
in dit geval, poort 9100. http://[IP-DevOps-Server]:9100

# Installatie Prometheus
Zodra aan al deze vereisten is voldaan, is uw systeem klaar om Prometheus te installeren.
Hieronder vindt u de procedure voor het downloaden en installeren van Prometheus.

## Gebruiker aanmaken en mappen aanmaken
- [ ] Voer het volgende in om Prometheus-gebruikersaccounts aan te maken die als servicegebruikersaccounts worden gebruikt voor beveiligings- en beheerdoeleinden. Deze accounts worden niet gebruikt om in te loggen op het systeem.
- [ ] Prometheus-mappen aanmaken

```
sudo useradd --no-create-home --shell /bin/false prome
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
```    

## Downloaden en uitpakken
- [ ] Haal de laatste versie op: https://prometheus.io/download/
- [ ] Pak 'm uit.
- [ ] Maak een nieuwe groep aan voor de aan te maken gebruiker;
- [ ] Voeg een nieuwe gebruiker toe, ken deze toe aan de zojuist gemaakte groep. Het aanmaken van een userdirectory is niet nodig voor deze gebruiker;
- [ ] Verplaats de gedownloade binary naar de juiste directory en geef het de juiste rechten

```
wget https://github.com/prometheus/prometheus/releases/download/v3.5.0/prometheus-3.5.0.linux-amd64.tar.gz
tar xvf prometheus-3.5.0.linux-amd64.tar.gz
sudo cp prometheus-3.5.0.linux-amd64/prometheus /usr/local/bin/
sudo cp prometheus-3.5.0.linux-amd64/promtool /usr/local/bin/
sudo chown prome:prome /usr/local/bin/prometheus
sudo chown prome:prome /usr/local/bin/promtool
sudo chown prome:prome /var/lib/prometheus
```

## Prometheus Configuration
- [ ] In deze sectie maken we het configuratiebestand prometheus.yml aan in de map /etc/prometheus die we in de vorige stappen hebben aangemaakt. Voer de volgende opdracht uit in Terminal om het bestand prometheus.yml te bewerken:
``` 
sudo nano /etc/prometheus/prometheus.yml
```

- [ ] Kopieer en plak vervolgens de volgende regels in prometheus.yml:
```
global:
  scrape_interval: 10s

scrape_configs:
  - job_name: "prometheus"
    static_configs:
      - targets: ["localhost:9090"]

  - job_name: "node-exporter"
    static_configs:
      - targets: ["localhost:9100"]
```
Druk op Ctrl+o om op te slaan en op Ctrl+x om het bestand te sluiten.

## Service aanmaken en starten
- [ ] Nu gaan we een nieuw bestand voor de systemd-service aanmaken. Voer hiervoor de volgende opdracht in de terminal uit:
```
sudo nano /etc/systemd/system/prometheus.service
```
- [ ] Kopieer en plak vervolgens de volgende regels in prometheus.service:
```
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prome
Group=prome
Type=simple
ExecStart=/usr/local/bin/prometheus \
    --config.file /etc/prometheus/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \

[Install]
WantedBy=multi-user.target
```
Druk op Ctrl+o om het bestand op te slaan en op Ctrl+x om het bestand te sluiten.

## Prometheuse service activeren en starten 
- [ ] Herlaadt u systemd met de volgende opdracht:
- [ ] Start de Prometheus-service
- [ ] Schakel de Prometheus-service in bij het opstarten van het systeem
- [ ] Bekijk de servicestatus
```
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus
sudo systemctl status prometheus
```

## Promotheus controleren

Open de Prometheus-webinterface
Probeer vervolgens de Prometheus-webinterface te openen. Open een webbrowser en ga naar het volgende adres:

http://ip-address:9090

# Installatie Grafana
## Installeren via apt
Volg de volgende stappen om Grafana te installeren vanuit de APT-repository:
- [ ] Installeer de vereiste pakketten
- [ ] Importeer de GPG-sleutel
- [ ] Om een ​​repository voor stabiele releases toe te voegen, voert u de volgende opdracht uit
- [ ] Voer de volgende opdracht uit om de lijst met beschikbare pakketten bij te werken
- [ ] Installeert de nieuwste OSS-release
```
sudo apt install -y apt-transport-https software-properties-common wget

sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null

echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt-get update
sudo apt-get install grafana
```

## Starten Grafana
Dit onderwerp bevat instructies voor het starten van de Grafana-server. Voor bepaalde configuratiewijzigingen moet u de Grafana-server mogelijk opnieuw opstarten om ze van kracht te laten worden.
De volgende instructies starten het grafana-serverproces als de grafana-gebruiker, die is aangemaakt tijdens de installatie van het pakket.
We kunnen de server starten met systemctl.
- [ ] We configureren Grafana-server zo dat deze bij het opstarten wordt gestart
- [ ] We starten de service
- [ ] We controleren of de service actief is
```
sudo systemctl enable grafana-server.service
sudo systemctl start grafana-server
sudo systemctl status grafana-server
```
## Configuratie Grafana
We hebben Grafana geïnstalleerd met behulp van apt, dan is het configuratiebestand /etc/grafana/grafana.ini
```
sudo nano /etc/grafana/grafana.ini
```
## Eerste login Grafana
- surf naar http://IP-Server:3000
- Gebruiker: admin
- Paswoord: admin
Wijzig het passwoord.

## Import dashboard
- Dashbord : 1860 - https://grafana.com/grafana/dashboards/1860-node-exporter-full
  
# Links
https://grafana.com/grafana/dashboards/1860-node-exporter-full/
https://www.thedutchlab.com/inzichten
https://uptrace.dev/tools/prometheus-for-docker

