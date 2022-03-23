sudo apt update
#Before starting, make sure you have installed Git
#Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
lazygit --version
rm -rf lazygit.tar.gz

#Testing Lazygit
git clone https://github.com/jesseduffield/lazygit.git lazygit-src
cd lazygit-src
lazygit

#Uninstall Lazygit
sudo rm -rf /usr/local/bin/lazygit


