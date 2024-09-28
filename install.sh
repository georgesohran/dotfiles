#/bin/bash

ln -s ~/.dotfiles/.config/nvim ~/.config/nvim
ln -s ~/.dotfiles/.config/alacritty ~/.config/alacritty
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.bashrc ~/.bashrc

# installing neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod u+x nvim.appimage
sudo mv nvim.appimage /bin/nvim

# installing tmux
# git clone https://github.com/tmux/tmux.git
# cd tmux
# sh autogen.sh
# ./configure
# make && sudo make install

