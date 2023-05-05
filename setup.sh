#!/bin/bash

echo "Linking resources"
ln $(pwd)/Xresources ~/.Xresources || true

echo "Update database"
xrdb -merge ~/.Xresources

sudo dnf install zsh curl rxvt-unicode -y
chsh -s /usr/bin/zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

