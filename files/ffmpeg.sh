sudo apt update

#Install FFmpeg
sudo add-apt-repository -y ppa:savoury1/ffmpeg4
sudo apt install -y ffmpeg
ffmpeg -version
ffmpeg -encoders
ffmpeg -decoders

#Testing FFmpeg
wget -O test.mp4 https://raw.githubusercontent.com/mediaelement/mediaelement-files/master/big_buck_bunny.mp4
ffmpeg -i test.mp4 out.mkv

#Uninstall FFmpeg
sudo apt purge --autoremove -y ffmpeg
sudo rm -rf /etc/apt/trusted.gpg.d/savoury1_ubuntu_ffmpeg4.gpg
sudo rm -rf /etc/apt/sources.list.d/savoury1-ubuntu-ffmpeg4-focal.list