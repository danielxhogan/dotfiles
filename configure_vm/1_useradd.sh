# git clone https://github.com/danielxhogan/dotfiles.git

apt install vim zsh curl

useradd -m hugexjackedman
passwd hugexjackedman
usermod -aG sudo hugexjackedman

echo "now you can open alacritty and run:"
echo "ssh 192.168.1.10"
