#!/bin/bash

# Maintainer: iTaysonLab
# Script maker: Shipa_2

VAR2="wayland"

OS1="arch"
OS2="debian"
OS3="fedora"

if [ "$XDG_SESSION_TYPE" = "$VAR2" ]; then
    echo "Wayland detected, continuing"

    source /etc/os-release
    if [ "$ID_LIKE" = "$OS1" ]; then
        echo "Your distro is Arch"
        yay -S --nodiffmenu --noeditmenu Waydroid
    elif [ "$ID_LIKE" = "$OS2" ]; then
        echo "Your distro is Debian"
        sudo apt install curl ca-certificates -y
        curl https://repo.waydro.id
        sudo apt install waydroid -y
    elif [ "$ID" = "$OS3" ]; then
        echo "Your distro is Fedora"
       sudo dnf install waydroid
       sudo systemctl enable --now waydroid-container
    else
        echo "Please write me: t.me/shipa_2"
        echo "Your distro is not recognized"
        exit
    fi

    sudo waydroid init -s GAPPS
    sudo systemctl enable waydroid-container.service
    sudo systemctl start waydroid-container.service
    waydroid session start
    waydroid prop set persist.waydroid.multi_windows true
    sudo systemctl restart waydroid-container.service

    waydroid app install VKX.apk
    waydroid session stop

    echo "Please set up volume and notifications in Waydroid settings"
    echo "пожалуйста, настройте уведомления и громкость в настройках Waydroid"
else
    echo "Please start this script under Wayland session"
    echo "https://wiki.archlinux.org/title/Wayland"
    exit
fi
