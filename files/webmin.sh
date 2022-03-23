sudo apt update

#Pre-Install Webmin
sudo wget -qO /etc/apt/trusted.gpg.d/jcameron-key.asc https://download.webmin.com/jcameron-key.asc
echo "deb https://download.webmin.com/download/repository sarge contrib" | sudo tee /etc/apt/sources.list.d/webmin.list
sudo apt update

sudo apt install -y ca-certificates
sudo apt update

#Install Webmin
sudo apt install -y webmin
sudo service webmin status
sudo service webmin stop
sudo service webmin start
sudo service webmin restart

#Testing Webmin
#Open a browser and type URL address https://<IP_ADDRESS>:10000

#Uninstall Webmin
sudo apt purge --autoremove -y webmin
sudo rm -rf /etc/apt/trusted.gpg.d/jcameron-key.asc
sudo rm -rf /etc/apt/sources.list.d/webmin.list
sudo rm -rf /usr/share/webmin
sudo rm -rf /webmin-setup.out
rm -rf ~/.tmp