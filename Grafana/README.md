# Installatie
We installeren 3 componenten
- Grafana: voor visualisatie
- Grafana Loki: Voor het verwerken van de verzamelde data
- Grafana Alloy: voor het verzamelen van data

## Grafana
### Installatie Grafana
Volg de volgende stappen om Grafana te installeren vanuit de APT-repository:
- [ ] Installeer de vereiste pakketten:
- [ ] Importeer de GPG-sleutel:
- [ ] Om een ​​repository voor stabiele releases toe te voegen, voert u de volgende opdracht uit:
- [ ] Voer de volgende opdracht uit om de lijst met beschikbare pakketten bij te werken:
- [ ] Installeert de nieuwste OSS-release:
```
sudo apt-get install -y apt-transport-https software-properties-common wget

sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null

echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt-get update
sudo apt-get install grafana
```
### Starten Grafana
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
### Configuratie Grafana
We hebben Grafana geïnstalleerd met behulp van apt, dan is het configuratiebestand /etc/grafana/grafana.ini
```
sudo nano /etc/grafana/grafana.ini
```
### Eerste login Grafana
- surf naar IP-Server:3000
- Gebruiker: admin
- Paswoord: admin
Weizig het passwoord.

## Grafana Loki lokaal installeren
### Installatie Grafana Loki
We gebruiken apt om de installatie te doen
```
sudo apt update
sudo apt install loki promtail
```
### Starten Grafana
```
sudo systemctl enable loki
sudo systemctl start loki
sudo systemctl status loki
```

## Grafana Alloy
### Installatie Grafana Alloy
We controleren of gpg geïnstalleerd is.
```
sudo apt install gpg
```
Om Alloy op Linux te installeren, voert u de volgende opdrachten uit in een terminalvenster.
- [ ] Import the GPG key and add the Grafana package repository.
- [ ] Werk de opslagplaatsen bij.
- [ ] Installeer Alloy.
```
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

sudo apt-get update
sudo apt-get install alloy
```
### Starten Grafana Alloy
Dit onderwerp bevat instructies voor het starten van de Grafana Alloy. 
We kunnen de server starten met systemctl.
- [ ] We configureren Grafana Alloy zo dat deze bij het opstarten wordt gestart
- [ ] We starten de service
- [ ] We controleren of de service actief is
```
sudo systemctl enable alloy.service
sudo systemctl start alloy
sudo systemctl status alloy
```
### Configuratie Grafana Alloy (EVENTUEEL)
Om Alloy op Linux te configureren, voert u de volgende stappen uit:
Bewerk het standaardconfiguratiebestand op /etc/default/alloy
We passen de configuratie aan dat hij een configuratie-map gebruikt i.p.v. een configuratie-bestand
```
CONFIG_FILE="/etc/alloy"
CUSTOM_ARGS=""
RESTART_ON_UPGRADE=true
```
op dit toetepassen herstarten we de service
```
sudo systemctl restart alloy
```
Bekijk de voorbeeld configuratie bestanden in deze folder van github.

# Documentatie over Alloy, Loki en Grafana
- Algemene Site: https://grafana.com/
- Grafana Alloy Configuration blocks : https://grafana.com/docs/alloy/latest/reference/config-blocks/ https://grafana.com/docs/alloy/latest/reference/config-blocks/
- Grafana loki components: https://grafana.com/docs/alloy/latest/reference/components/loki/
- Github: https://github.com/grafana/alloy-scenarios/

