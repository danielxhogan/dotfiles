# git clone https://github.com/danielxhogan/dotfiles.git

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
