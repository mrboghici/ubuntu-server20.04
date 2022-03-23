sudo apt update
sudo apt install -y apt-transport-https

#Install Docker CE
wget -qO - https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -sc) stable" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt install -y docker-ce

sudo usermod -a -G docker $USER
docker version
sudo service docker status

sudo service docker stop
sudo service docker start
sudo service docker restart

docker run hello-world

#Uninstall Docker CE
sudo apt purge --autoremove -y docker-ce
sudo groupdel docker
sudo ip link delete docker0
sudo rm -rf /usr/share/keyrings/docker-archive-keyring.gpg
sudo rm -rf /etc/apt/sources.list.d/docker.list
sudo rm -rf /etc/docker
sudo rm -rf /var/lib/docker
sudo rm -rf /run/docker
sudo rm -rf /var/run/docker.sock
sudo rm -rf /var/lib/containerd
sudo rm -rf /opt/containerd