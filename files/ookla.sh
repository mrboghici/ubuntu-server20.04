sudo apt update
#Install OOkla
wget -qO - https://install.speedtest.net/app/cli/install.deb.sh | sudo bash
sudo apt install -y speedtest
speedtest --version
speedtest

#Uninstall Speedtest CLI
sudo apt purge --autoremove -y speedtest
sudo apt-key del E723ACAA
sudo rm -rf /etc/apt/sources.list.d/ookla_speedtest-cli.list
rm -rf ~/.config/ookla
