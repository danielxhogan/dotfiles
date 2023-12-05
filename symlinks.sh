mkdir ~/.config/i3
ln -s ~/dotfiles/i3 ~/.config/i3/config

mkdir ~/.config/i3status
ln -s ~/dotfiles/i3status ~/.config/i3status/config

mkdir ~/.config/alacritty
ln -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

ln -s ~/dotfiles/picom.conf ~/.config/picom.conf

ln -s ~/dotfiles/vscode.json ~/.config/Code/User/settings.json

ln -s ~/dotfiles/qmk/qmk.ini ~/.config/qmk/qmk.ini
ln -s ~/dotfiles/qmk/kyrisuh ~/qmk_firmware/keyboards/splitkb/kyria/keymaps/kyrisuh