# git clone https://github.com/danielxhogan/dotfiles.git

apt install vim zsh curl exa cifs-utils

useradd -m hugexjackedman
passwd hugexjackedman
usermod -aG sudo hugexjackedman

echo "now you can open alacritty and ssh in:"
ip a | grep 192.168.1
