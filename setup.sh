#!/bin/bash

echo "Linking resources"
ln -s $(pwd)/Xresources ~/.Xresources || true

echo "Update database"
xrdb ~/.Xresources

sudo dnf install zsh curl rxvt-unicode -y
chsh -s /usr/bin/zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

