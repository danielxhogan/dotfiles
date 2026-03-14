rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

mkdir ~/.config

mkdir ~/.config/alacritty
ln -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

mkdir -p ~/programs/compiled/src ~/programs/compiled/install
ln -s ~/dotfiles/build_scripts ~/programs/compiled

mkdir ~/.config/mpv
ln -s ~/dotfiles/mpv/mpv.conf ~/.config/mpv/mpv.conf
ln -s ~/dotfiles/mpv/input.conf ~/.config/mpv/input.conf

mkdir ~/.config/mpv/script-opts
ln -s ~/dotfiles/mpv/script-opts/osc.conf ~/.config/mpv/script-opts/osc.conf
ln -s ~/dotfiles/mpv/script-opts/stats.conf ~/.config/mpv/script-opts/stats.conf

mkdir ~/.config/mpv/scripts
ln -s ~/dotfiles/mpv/scripts/toggle_osc.lua ~/.config/mpv/scripts/toggle_osc.lua
ln -s ~/dotfiles/mpv/scripts/show_osc_on_seek.lua ~/.config/mpv/scripts/show_osc_on_seek.lua
ln -s ~/dotfiles/mpv/scripts/inspect.lua ~/.config/mpv/scripts/inspect.lua

ln -s ~/dotfiles/vscode.json ~/.config/Code/User/settings.json

ln -s ~/dotfiles/qmk/qmk.ini ~/.config/qmk/qmk.ini
ln -s ~/dotfiles/qmk/kyrisuh ~/qmk_firmware/keyboards/splitkb/kyria/keymaps/kyrisuh

mkdir ~/.config/i3
ln -s ~/dotfiles/i3 ~/.config/i3/config

mkdir ~/.config/i3status
ln -s ~/dotfiles/i3status ~/.config/i3status/config

ln -s ~/dotfiles/picom.conf ~/.config/picom.conf
