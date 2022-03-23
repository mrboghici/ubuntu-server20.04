sudo apt update

#Install Nginx
sudo add-apt-repository -y ppa:ondrej/nginx
sudo apt install -y nginx
nginx -v
sudo systemctl enable nginx
sudo service nginx status
sudo service nginx stop
sudo service nginx start
sudo service nginx restart

#Testing Nginx
hostname -I
#Open a web browser and type the IP address obtained with hostname -I

#Uninstall Nginx
sudo apt purge --autoremove -y nginx
sudo systemctl disable nginx
sudo systemctl daemon-reload
sudo systemctl reset-failed
sudo rm -rf /etc/apt/trusted.gpg.d/ondrej_ubuntu_nginx.gpg
sudo rm -rf /etc/apt/sources.list.d/ondrej-ubuntu-nginx-focal.list