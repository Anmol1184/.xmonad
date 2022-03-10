#!/usr/bin/env bash

## Copyright (C) 2020-2021 Aditya Shakya <adi1090x@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3
## Autostart Programs

# Kill already running process
_ps=(picom dunst ksuperkey mpd xfce-polkit xfce4-power-manager)
for _prs in "${_ps[@]}"; do
	if [[ `pidof ${_prs}` ]]; then
		killall -9 ${_prs}
	fi
done

# Dex
dex -a -s ~/.xmonad/autostart/
# Fix cursor
xsetroot -cursor_name left_ptr

# Polkit agent

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# Enable power management
xfce4-power-manager &

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

# Restore wallpaper
# hsetroot -cover ~/.xmonad/wallpaper.png
nitrogen --restore
# Lauch notification daemon
~/.xmonad/bin/xmodunst.sh

# Lauch polybar
~/.xmonad/bin/xmobar.sh

# Lauch compositor
~/.xmonad/bin/xmocomp.sh

# Start mpd
exec mpd &
