# git clone https://github.com/danielxhogan/dotfiles.git

ln -s ~/dotfiles/.zshrc ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
zsh
