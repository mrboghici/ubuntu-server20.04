sudo apt update
#Install Heimdall

#Step 1 — Download Heimdall from GitHub
RELEASE=$(curl -sX GET "https://api.github.com/repos/linuxserver/Heimdall/releases/latest" | awk '/tag_name/{print $4;exit}' FS='[""]'); echo $RELEASE &&\
curl --silent -o ${RELEASE}.tar.gz -L "https://github.com/linuxserver/Heimdall/archive/${RELEASE}.tar.gz"
ls *.tar.gz
tar xvzf 2.2.2.tar.gz
ls *2.2.2/

#Step 2 — Install PHP modules on Ubuntu 20.04
sudo apt install php-sqlite3 php-zip

#Step 3 — Run Heimdall Dashboard with php artisan serve
cd Heimdall*/
php artisan serve

# if ERROR
#To fix it, edit the ArrayInput.php at line 135 with 
vim ./vendor/symfony/console/Input/ArrayInput.php +135 
#and comment on the elseif line and what’s inside. 
php artisan serve

#http://127.0.0.1:8000/

#Step 4 — Auto-start Heimdall using systemd service
sudo vim /etc/systemd/system/heimdall.service
#
[Unit]
Description=Heimdall
After=network.target

[Service]
Restart=always
RestartSec=5
Type=simple
User=lgtm
Group=lgtm
WorkingDirectory=/home/lgtm/Heimdall-2.2.2
#ExecStart="/usr/bin/php" artisan serve --port 7889
ExecStart="/usr/bin/php" artisan serve --host <IPADDR> --port 7889
TimeoutStopSec=30

[Install]
WantedBy=multi-user.target
#
sudo systemctl enable --now heimdall.service
#Now open your browser and enter http://127.0.0.1:7889/
