#!/bin/bash -e

VER=1.2
FORCE=$2
THIS_PATH="$(pwd)"

function markdone()
{
    val=$1
    markpath=~/.config/higen_theme
    markfile=${markpath}/${val}_${VER}
    if ! [ -f "${markfile}" ]; then
	mkdir -p ${markpath}
	touch ${markfile}
	echo 0
    else
	echo 1
    fi
}


if [ $(markdone linking) == 0 ]; then
    echo "Linking resources"
    ln -s $(pwd)/Xresources ~/.Xresources || true
fi

echo "Update database"
xrdb ~/.Xresources

if [ $(markdone zsh) == 0 ]; then
    echo "Setting up ZSH shell"
    sudo dnf install -y zsh curl rxvt-unicode
    chsh -s /usr/bin/zsh
fi

if [ $(markdone ohmyzsh) == 0 ]; then
    echo "Installing Oh-My-Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ $(markdone systemd) == 0 ]; then
    echo "Setting up systemd"
    systemdpath="/etc/systemd/system"
    sudo cp ./urxvtd.service ${systemdpath}
    sudo cp ./urxvtd.socket ${systemdpath}
    sudo systemctl enable urxvtd.socket
fi

if [ $(markdone autostart) == 0 ]; then
    echo "Setting up autostart"
    targetpath="${HOME}/.config/autostart"
    cat <<EOF > ${targetpath}/start_urxvt.sh.desktop
[Desktop Entry]
Exec=${THIS_PATH}/start_urxvt.sh
Icon=dialog-scripts
Name=start_urxvt.sh
Path=
Type=Application
X-KDE-AutostartScript=true
EOF
fi

