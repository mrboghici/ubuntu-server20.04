sudo apt update

#Install qBittorrent-nox
sudo add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable
sudo apt install -y qbittorrent-nox
qbittorrent-nox --version

#Run qBittorrent-nox as a service
sudo nano /etc/systemd/system/qbittorrent-nox.service

#Add following content to the file:
[Unit]
Description=qBittorrent client
After=network.target
 
[Service]
ExecStart=/usr/bin/qbittorrent-nox --webui-port=8080
Restart=always
 
[Install]
WantedBy=multi-user.target
#

sudo service qbittorrent-nox start
sudo service qbittorrent-nox status
sudo service qbittorrent-nox stop
sudo service qbittorrent-nox restart
sudo systemctl enable qbittorrent-nox

#Testing qBittorrent-nox
#Open a browser and enter URL address http://<IP_ADDRESS>:8080

#Uninstall qBittorrent-nox
sudo service qbittorrent-nox stop
sudo systemctl disable qbittorrent-nox
sudo rm -rf /etc/systemd/system/qbittorrent-nox.service
sudo systemctl daemon-reload
sudo systemctl reset-failed

sudo apt purge --autoremove -y qbittorrent-nox
sudo rm -rf /etc/apt/trusted.gpg.d/qbittorrent-team_ubuntu_qbittorrent-stable.gpg
sudo rm -rf /etc/apt/sources.list.d/qbittorrent-team-ubuntu-qbittorrent-stable-focal.list
sudo rm -rf /.config/qBittorrent
sudo rm -rf /.local/share/qBittorrent
sudo rm -rf /.cache/qBittorrent
rm -rf ~/.config/qBittorrent
rm -rf ~/.local/share/qBittorrent
rm -rf ~/.cache/qBittorrent