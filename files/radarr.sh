sudo apt update
#Install Radarr (Movies)
#https://varhowto.com/install-radarr-ubuntu-20-04/
#Step 1 — Install Mono, the framework Radarr is written in
sudo apt install mono-devel
sudo apt install gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
sudo apt install mono-devel
mono --version
#Step 2 — Install dependencies for Radarr
sudo apt install curl mediainfo
#Step 3 — Install latest Radarr release on Ubuntu 20.04
curl -L -O $( curl -s https://api.github.com/repos/Radarr/Radarr/releases | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d \" -f 4 )
ls Radarr*
tar -xvzf Radarr.*.linux.tar.gz

#Different from the official Radarr installation guide
#The official Radarr installation guide suggests us to move the 
#Radarr directory to the /opt directory by running the following command. 
#The /opt directory is used for third-party packages that are not 
#in Ubuntu’s packaging system, so it is supposed to be perfectly reasonable to set up the Radarr files there.
#However, the /opt directory is owned by the root user and, 
#if you only set up for personal use, you don’t have to follow 
#all the rules to avoid the undesired permission issues. 
#It is your house anyway. Theoretically, you should set up a user 
#called radarr to run Radarr so it is not allowed to write any of your personal files but it doesn’t have be like this.
mv Radarr /opt
#Here we choose not to install Radar to /opt to avoid permission and self-update issues

#Start Radarr
mono ~/Radarr/Radarr.exe

#Open Radarr in browser with default port 7878
# http://localhost:7878/

sudo vim /etc/systemd/system/radarr.service

[Unit]
Description=Radarr Daemon
After=syslog.target network.target

[Service]
# Change and/or create the required user and group.
User=vh
Group=vh

Type=simple

# Change the path to Radarr or mono here if it is in a different location for you.
ExecStart=/usr/bin/mono --debug /home/vh/Radarr/Radarr.exe -nobrowser
TimeoutStopSec=20
KillMode=process
Restart=on-failure

# These lines optionally isolate (sandbox) Radarr from the rest of the system.
# Make sure to add any paths it might use to the list below (space-separated).
#ReadWritePaths=/opt/Radarr /path/to/movies/folder
#ProtectSystem=strict
#PrivateDevices=true
#ProtectHome=true

[Install]
WantedBy=multi-user.target
#You can also specify -data for a customized config directory, the default 
#Radarr configuration files will be located in ~/.config/Radarr

#Enable/start Radarr systemd service
sudo systemctl enable --now radarr.service
sudo systemctl status radarr.service

#you can open http://localhost:7878/ 
sudo systemctl stop radarr.service
sudo systemctl restart radarr.service

#How to uninstall Radarr
sudo systemctl disable radarr.service
sudo remove /etc/systemd/system/radarr.service
rm -rf ~/Radarr/