sudo apt update

#Install Redis
sudo add-apt-repository -y ppa:redislabs/redis
sudo apt install -y redis
redis-server --version
sudo systemctl enable redis-server
sudo service redis-server status
sudo service redis-server stop
sudo service redis-server start
sudo service redis-server restart

#Testing Redis
redis-cli
127.0.0.1:6379> PING
PONG

127.0.0.1:6379> SET message "Hello"
OK
127.0.0.1:6379> GET message
"Hello"

127.0.0.1:6379> QUIT

#Uninstall Redis
sudo apt purge --autoremove -y redis
sudo systemctl disable redis-server
sudo systemctl daemon-reload
sudo systemctl reset-failed
sudo rm -rf /etc/apt/trusted.gpg.d/redislabs_ubuntu_redis.gpg
sudo rm -rf /etc/apt/sources.list.d/redislabs-ubuntu-redis-focal.list
rm -rf ~/.rediscli_history