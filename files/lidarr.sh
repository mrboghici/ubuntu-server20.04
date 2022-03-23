sudo apt update
#Install Lidarr (Music)
#https://varhowto.com/install-lidarr-ubuntu-20-04/

#Step 1 — Install Mono, the runtime Lidarr is written in
sudo apt install gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
sudo apt install mono-devel
mono --version

#Step 2 — Install latest Lidarr release
curl -L -O $( curl -s https://api.github.com/repos/Lidarr/Lidarr/releases | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d \" -f 4 )
ls Lidarr*
tar -xvzf Lidarr.*.linux.tar.gz
mv Lidarr /opt
mono ~/Lidarr/Lidarr.exe
# http://localhost:8686/
sudo vim /etc/systemd/system/lidarr.service
#
[Unit]
Description=Lidarr Daemon
After=syslog.target network.target

[Service]
# Change and/or create the required user and group.
User=vh
Group=vh

Type=simple

# Change the path to Lidarr or mono here if it is in a different location for you.
ExecStart=/usr/bin/mono --debug /home/vh/Lidarr/Lidarr.exe -nobrowser
TimeoutStopSec=20
KillMode=process
Restart=on-failure

# These lines optionally isolate (sandbox) Lidarr from the rest of the system.
# Make sure to add any paths it might use to the list below (space-separated).
#ReadWritePaths=/opt/Lidarr /path/to/music/folder
#ProtectSystem=strict
#PrivateDevices=true
#ProtectHome=true

[Install]
WantedBy=multi-user.target
#
sudo systemctl enable --now lidarr.service
sudo systemctl status lidarr.service
sudo systemctl stop lidarr.service
sudo systemctl restart lidarr.service

#Uninstall Lidarr
sudo systemctl disable lidarr.service
sudo remove /etc/systemd/system/lidarr.service
rm -rf ~Lidarr/