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

docker run -d --name jenkins-docker -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 --restart=on-failure jenkins/jenkins:lts-jdk17
docker exec -it jenkins-docker /bin/bash
cd /var/jenkins_home/secrets
cat initialAdminPassword

