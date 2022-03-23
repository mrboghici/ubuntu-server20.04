sudo apt update

#Install Grafana
sudo wget -qO /etc/apt/trusted.gpg.d/grafana.asc https://packages.grafana.com/gpg.key
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee /etc/apt/sources.list.d/grafana.list
sudo apt update
udo apt install -y grafana
grafana-server -v
sudo service grafana-server start
sudo service grafana-server status
sudo service grafana-server stop
sudo service grafana-server restart
sudo systemctl enable grafana-server

#Testing Grafana
#Open a browser and go to address http://<IP_ADDRESS>:3000

#Uninstall Grafana
sudo apt purge --autoremove -y grafana
sudo service grafana-server stop
sudo systemctl disable grafana-server
sudo systemctl daemon-reload
sudo systemctl reset-failed
sudo rm -rf /etc/apt/trusted.gpg.d/grafana.asc
sudo rm -rf /etc/apt/sources.list.d/grafana.list
sudo deluser grafana
sudo rm -rf /var/lib/grafana
sudo rm -rf /var/log/grafana
sudo rm -rf /etc/grafana
sudo rm -rf /run/grafana