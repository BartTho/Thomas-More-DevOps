## Jenkins Demo
# Installatie
We doen dit in een container omdat we geen Java op onze machine wensen
We maken eerst een folder aan waarin jenkins de gegevens kan bewaren

mkdir /var/jenkins_home

rechten instellen
sudo chmod 755 /var/jenkins_home

gebruiker bart (uw login) rechten geven op de folder
sudo chown bart:bart /var/jenkins_home

container starten en gebruiker die rechten heeft op /var/jenkins_home meegeven.

##docker run -d --name jenkins-docker -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 --restart=on-failure jenkins/jenkins:lts-jdk17
##docker exec -it jenkins-docker /bin/bash
##cd /var/jenkins_home/secrets
##cat initialAdminPassword

######################

sudo apt update

sudo apt install fontconfig openjdk-17-jre

java -version

openjdk version "17.0.8" 2023-07-18

OpenJDK Runtime Environment (build 17.0.8+7-Debian-1deb12u1)

OpenJDK 64-Bit Server VM (build 17.0.8+7-Debian-1deb12u1, mixed mode, sharing)

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update

sudo apt-get install jenkins

cat /var/jenkins_home/secrets/initialAdminPassword

######################
