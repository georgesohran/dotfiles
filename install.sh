#/bin/bash

ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/.tmux ~/.tmux
ln -s ~/.dotfiles/.bashrc ~/.bashrc

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage /bin/nvim
