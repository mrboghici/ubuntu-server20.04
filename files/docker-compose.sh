sudo apt update

#Make sure you have installed Docker
#Install Docker Compose
sudo curl -Lo /usr/local/bin/docker-compose https://github.com/docker/compose/releases/latest/download/docker-compose-Linux-x86_64
sudo chmod a+x /usr/local/bin/docker-compose
docker-compose --version

#Testing Docker Compose
mkdir test
cd test
nano docker-compose.yml
#Add the following content to a file:
version: '3.8'
services:
   hello-world:
      image:
         hello-world:latest
#
docker-compose up

#Uninstall Docker Compose
sudo rm -rf /usr/local/bin/docker-compose