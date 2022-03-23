sudo apt update

#Make sure you have Docker in your system
#Install Portainer
docker run -d --name=portainer --restart=always --network=host \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce

#Testing Portainer
#Open your browser and go to http://<IP_ADDRESS>:9000

#Uninstall Portainer
docker rm --force portainer
docker rmi portainer/portainer-ce
docker volume rm portainer_data