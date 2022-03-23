sudo apt update
#Install Sonarr (TV-shows)
#https://varhowto.com/install-sonarr-ubuntu-20-04/
#Step 1 — Install Mono, the framework Sonarr is written in
sudo apt install gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
udo apt update

sudo apt install mono-devel
mono --version

#Step 2 — Add official Sonarr key
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0xA236C58F409091A18ACA53CBEBFF6B99D9B78493
#Step 3 — Add official Sonarr repo to Ubuntu 20.04
echo "deb http://apt.sonarr.tv/ master main" | sudo tee /etc/apt/sources.list.d/sonarr.list
sudo apt update
#Step 4 — Install sonarr
sudo apt install nzbdrone
#Sonarr will be installed in /opt/NzbDrone directory.

#Start Sonarr
mono /opt/NzbDrone/NzbDrone.exe
#http://localhost:8989/

sudo vim /etc/systemd/system/sonarr.service
#
[Unit]
Description=Sonarr Daemon
After=network.target

[Service]
# Change and/or create the required user and group.
User=vh
Group=vh

# The UMask parameter controls the permissions of folders and files created.
#UMask=002

# The -data=/path argument can be used to force the config/db folder
ExecStart=/usr/bin/mono --debug /opt/NzbDrone/NzbDrone.exe -nobrowser

Type=simple
TimeoutStopSec=20
KillMode=process
Restart=on-failure

[Install]
WantedBy=multi-user.target
#

sudo systemctl enable --now sonarr.service
sudo systemctl status sonarr.service
sudo systemctl stop sonarr.service
sudo systemctl restart sonarr.service

#Uninstall Sonarr
sudo systemctl disable sonarr.service
sudo remove /etc/systemd/system/sonarr.service
sudo rm -rf /opt/NzbDrone/