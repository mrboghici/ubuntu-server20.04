sudo apt update

#Install pip
wget -q https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
pip3 --version
rm -rf get-pip.py

#Testing pip
sudo pip3 install pytz
pip3 list

#Uninstall pip
sudo pip3 uninstall -y pip wheel
sudo rm -rf /root/.cache/pip
rm -rf ~/.cache/pip