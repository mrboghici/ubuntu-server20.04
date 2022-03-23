sudo apt update
#Install cpufetch
sudo wget -O /usr/local/bin/cpufetch https://github.com/Dr-Noob/cpufetch/releases/latest/download/cpufetch_x86-64_linux
sudo chmod a+x /usr/local/bin/cpufetch
cpufetch --version

#Testing cpufetch
cpufetch

#Uninstall cpufetch
sudo rm -rf /usr/local/bin/cpufetch

