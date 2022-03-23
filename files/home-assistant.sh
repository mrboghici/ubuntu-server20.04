sudo apt update

#Before starting, make sure you have installed Docker in your system
#Install Home Assistant
docker run -d --name=homeassistant --restart=always --network=host \
    -v /etc/homeassistant:/config \
    homeassistant/home-assistant:stable

#Testing Home Assistant
#Home Assistant can be accessed using http://<IP_ADDRESS>:8123

#Uninstall Home Assistant
docker rm --force homeassistant
docker rmi homeassistant/home-assistant:stable
sudo rm -rf /etc/homeassistant