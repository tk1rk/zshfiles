#!/usr/bin/env sh

# yay
cd $HOME/.local/share/ \
git clone https://aur.archlinux.org/yay.git \
cd yay \
makepkg -si

# paru
git clone https://aur.archlinux.org/paru.git \
cd paru \
makepkg -si

# apps
sudo pacman -Syy --needed base-devel git aria2 \


# rustup
 curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh \
 

