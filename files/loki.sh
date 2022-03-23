sudo apt update

#Install Loki
LOKI_VERSION=$(curl -s "https://api.github.com/repos/grafana/loki/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
sudo mkdir /opt/loki
sudo wget -qO /opt/loki/loki.gz "https://github.com/grafana/loki/releases/download/v${LOKI_VERSION}/loki-linux-amd64.zip"
sudo gunzip /opt/loki/loki.gz
sudo chmod a+x /opt/loki/loki
sudo ln -s /opt/loki/loki /usr/local/bin/loki
sudo wget -qO /opt/loki/loki-local-config.yaml "https://raw.githubusercontent.com/grafana/loki/v${LOKI_VERSION}/cmd/loki/loki-local-config.yaml"
loki -version

#Run Loki as a service
sudo nano /etc/systemd/system/loki.service
#Add the following content to the file:
[Unit]
Description=Loki log aggregation system
After=network.target
 
[Service]
ExecStart=/opt/loki/loki -config.file=/opt/loki/loki-local-config.yaml
Restart=always
 
[Install]
WantedBy=multi-user.target
#
sudo service loki start
sudo service loki status
sudo service loki stop
sudo service loki restart
sudo systemctl enable loki

#Uninstall Loki
sudo service loki stop
sudo systemctl disable loki
sudo rm -rf /etc/systemd/system/loki.service
sudo systemctl daemon-reload
sudo systemctl reset-failed
sudo rm -rf /opt/loki
sudo rm -rf /usr/local/bin/loki