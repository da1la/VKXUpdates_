# Maintainer: iTaysonLab
# Script maker: Shipa_2
VAR2="wayland"

if [ "$XDG_SESSION_TYPE" = "$VAR2" ]; then
    echo "Wayland detected, continuig"

	yay -S --nodiffmenu --noeditmenu Waydroid
	sudo waydroid init -s GAPPS
	sudo systemctl enable waydroid-container.service
	sudo systemctl start waydroid-container.service

	waydroid session start
	waydroid prop set persist.waydroid.multi_windows true

	waydroid app install VKX.apk
	waydroid session stop
	echo "please set up volume and notifications in waydroid setting"
	echo "пожалуйста, настройте уведомления и громкость в настройках waydroid"

else
    echo "Please, start that script under wayland session"
    echo 'https://wiki.archlinux.org/title/Wayland'
    exit
fi
