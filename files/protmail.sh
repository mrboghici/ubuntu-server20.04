sudo apt update
#Before starting, make sure you have installed Loki in your system
#Install protmail
PROMTAIL_VERSION=$(curl -s "https://api.github.com/repos/grafana/loki/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
sudo mkdir /opt/promtail
sudo wget -qO /opt/promtail/promtail.gz "https://github.com/grafana/loki/releases/download/v${PROMTAIL_VERSION}/promtail-linux-amd64.zip"
sudo gunzip /opt/promtail/promtail.gz
sudo chmod a+x /opt/promtail/promtail
sudo ln -s /opt/promtail/promtail /usr/local/bin/promtail
sudo wget -qO /opt/promtail/promtail-local-config.yaml "https://raw.githubusercontent.com/grafana/loki/v${PROMTAIL_VERSION}/clients/cmd/promtail/promtail-local-config.yaml"
promtail -version

#Run Promtail as a service
sudo nano /etc/systemd/system/promtail.service
#Add the following content
[Unit]
Description=Promtail client for sending logs to Loki
After=network.target
 
[Service]
ExecStart=/opt/promtail/promtail -config.file=/opt/promtail/promtail-local-config.yaml
Restart=always
TimeoutStopSec=3
 
[Install]
WantedBy=multi-user.target
#
sudo service promtail start
sudo service promtail status
sudo service promtail stop
sudo service promtail restart
sudo systemctl enable promtail

#Uninstall Promtail
sudo service promtail stop
sudo systemctl disable promtail
sudo rm -rf /etc/systemd/system/promtail.service
sudo systemctl daemon-reload
sudo systemctl reset-failed
sudo rm -rf /opt/promtail
sudo rm -rf /usr/local/bin/promtail