sudo apt update
#Install Jackett (Provider)
#https://varhowto.com/install-jackett-ubuntu-20-04/

#Step 1 — Install Mono, the framework Jackett is written in
sudo apt install gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
sudo apt install mono-devel
mono --version

#Step 2 — Download latest Jackett release
curl -L -O $( curl -s https://api.github.com/repos/Jackett/Jackett/releases | perl -pe 's/^.+?browser_download_url.+?(https.+?Jackett.Binaries.LinuxAMDx64.tar.gz).+/$1/;' )
ls Jackett.Binaries.LinuxAMDx64.tar.gz
tar -xvzf Jackett.Binaries.LinuxAMDx64.tar.gz

#Step 3 — Start Jackett on Ubuntu 20.04
cd Jackett
./jackett

# http://localhost:9117/
sudo ./install_service_systemd.sh

sudo nano /etc/systemd/system/jackett.service
#
[Unit]
Description=Jackett Daemon
After=network.target

[Service]
SyslogIdentifier=jackett
Restart=always
RestartSec=5
Type=simple
User=vh
Group=vh
WorkingDirectory=/home/vh/Jackett
ExecStart=/bin/sh "/home/vh/Jackett/jackett_launcher.sh"
TimeoutStopSec=30

[Install]
WantedBy=multi-user.target
#
sudo systemctl status jackett.service
sudo systemctl stop jackett.service
sudo systemctl restart jackett.service

#Uninstall Jackett
sudo systemctl disable jackett.service
sudo remove /etc/systemd/system/jackett.service
rm -rf ~/Jackett/