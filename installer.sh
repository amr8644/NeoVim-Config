#!/bin/bash



sudo pacman -Syu
sudo pacman -S cowsay

# Dev enviroment
echo "Installing Dev enviroment" | cowsay 
sudo pacman -S tmux neovim  zsh neofetch
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim

chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo "Installing libs" | cowsay 
# Libs
sudo pacman -S base-devel autoconf git
cd Downloads
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
cd

echo "Installing .dotfiles" | cowsay 
# Dotfiles
git clone https://github.com/amr8644/.dotfiles.git


echo "Installing programming languages" | cowsay 
# Programming Languages
sudo pacman -S go gcc nodejs



echo "Installing utils" | cowsay 
# Utils
yay -S brave-bin obsidian
sudo pacman -S nginx-mainline docker ufw openvpn htop dmenu i3

rice() {

    echo "Installing fonts" | cowsay 
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
    unzip JetBrainsMono.zip
    sudo mv JetBrainsMono /usr/share/fonts
  

    sudo echo FONT=JetBrainsMonoNerdFont-Bold 12 >> /etc/locale.conf
    sudo fc-cache -fv

    echo "Installing picom and teriminal" | cowsay 
    yay -S picom-git

    sudo pacman -S alacritty
    export TERMINAL=alacritty

    ln -s ~/.dotfiles/.config/polybar/config.ini ~/.config/polybar/config.ini
    ln -s ~/.dotfiles/.config/polybar/l.sh ~/.config/polybar/l.sh
    ln -s ~/.dotfiles/.config/picom/picom.conf ~/.config/picom/picom.conf
    ln -s ~/.dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
}




echo "Creating system links" | cowsay
ln -s ~/.dotfiles/.config/i3/config ~/.config/i3/config
ln -s ~/.dotfiles/.config/nvim ~/.config/nvim
ln -s ~/.dotfiles/.config/tmux ~/.config/tmux
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.vimrc ~/.vimrc


#!/bin/bash

echo "Do you want to rice? [y/n]"
read ans
echo "$ans" 

if [[ "$ans" == "yes" || "$ans" == "y" ]]; then
    rice
else
  echo "sure"  
fi

reboot
