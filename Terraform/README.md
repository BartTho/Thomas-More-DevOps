## Installtie OpenTofu of Terraform

Installatie van OpenTofu  
- https://opentofu.org/  
Installatie van Terraform  
- https://developer.hashicorp.com/terraform  

### check
tofu --version

## 1. Start het AWS Learner Lab

## 2. AWS CLI installeren op Ubuntu Subsystem
Installeren of updaten naar de nieuwste versie van de AWS CLI - AWS Co…
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

AWS CLI v2 installeren op WSL (Ubuntu) - DEV Community
https://dev.to/pu-lazydev/installing-aws-cli-v2-on-wsl-ubuntu-plg
De AWS Command Line Interface (CLI) kan worden geïnstalleerd op het Ubuntu Subsystem voor Linux (WSL) om AWS-services rechtstreeks vanuit de terminal te beheren. 
Hieronder vindt u twee methoden om AWS CLI v2 te installeren.

## Het officiële installatieprogramma gebruiken
### Stap 1: Systeempakketten bijwerken Voer de volgende opdrachten uit om uw systeem bij te werken en te upgraden:
```
sudo apt update
sudo apt upgrade -y
```

### Stap 2: De vereiste tools installeren Zorg ervoor dat unzip en curl zijn geïnstalleerd:
```
sudo apt install -y unzip curl
```

### Stap 3: Het AWS CLI-installatieprogramma downloaden Download het nieuwste AWS CLI v2-pakket:
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
```

### Stap 4: Uitpakken en installeren Pak het pakket uit en installeer het:
```
unzip awscliv2.zip
sudo ./aws/install
```

### Stap 5: De installatie controleren Controleer of AWS CLI correct is geïnstalleerd:
```
aws --version
```

## Configuratie na installatie
Configureer na de installatie AWS CLI met je inloggegevens:
```
aws configure
```

## Geef de volgende gegevens op wanneer gevraagd:
- AWS-toegangssleutel-ID
- AWS geheime toegangssleutel
- Standaard regionaam  -> Wij kiezen us-east-1
- Standaard uitvoerformaat (JSON, tekst, YAML) -> Wij kiezen JSON

## 3. Installeer OpenTofu

# Download het installer script:
```
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh
# Je kan ook gebruik maken van wget wget --secure-protocol=TLSv1_2 --https-only https://get.opentofu.org/install-opentofu.sh -O install-opentofu.sh
# Stel het execution recht in:
chmod +x install-opentofu.sh

# Run de installer:
./install-opentofu.sh --install-method deb

# Verwijder de installer:
rm -f install-opentofu.sh
```

## 4. Gerbuik OpenTofu

## Proxmox
### Gebruiker er rol voor proxmox, token opvragen.
pveum user add terraform@pam --password 'MotDePasseSecurisé123!'
pveum acl modify / --user terraform@pam --role Administrator
pveum user token add terraform@pam terraform-token --comment "Token Terraform"
