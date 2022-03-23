sudo apt update
#Install youtube-dl
sudo wget -qO /usr/local/bin/youtube-dl https://yt-dl.org/downloads/latest/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
youtube-dl --version
#If you get an error message /usr/bin/env: 'python': 
#No such file or directory, you need to create a symbolic link for /usr/bin/python because Ubuntu 20.04 only has Python 3 by default.
sudo ln -s /usr/bin/python3 /usr/bin/python
sudo youtube-dl -U

#Testing youtube-dl
youtube-dl <VIDEO_URL>

#The -x option can be used to convert video files to audio only files. This feature requires FFmpeg
youtube-dl -x <VIDEO_URL>

#Uninstall youtube-dl
sudo rm -rf /usr/local/bin/youtube-dl
