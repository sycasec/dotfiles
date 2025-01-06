#!/usr/bin/env bash

#  ╔══════════════════════════════════════════════════════════╗
#  ║                 set PATH and variables                   ║
#  ╚══════════════════════════════════════════════════════════╝
#  ╔══════════════════════════════════════════════════════════╗
#  ║                reset XDPH for screenshare                ║
#  ╚══════════════════════════════════════════════════════════╝
sleep 1
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-gnome
killall xdg-desktop-portal-kde
killall xdg-desktop-portal-lxqt
killall xdg-desktop-portal-wlr
killall xdg-desktop-portal
sleep 1
/usr/lib/xdg-desktop-portal-hyprland &
sleep 2
/usr/lib/xdg-desktop-portal &

#  ╒══════════════════════════════════════════════════════════╕

#  ╘══════════════════════════════════════════════════════════╛
# https://wiki.hyprland.org/FAQ/#some-of-my-apps-take-a-really-long-time-to-open
# https://gist.github.com/PowerBall253/2dea6ddf6974ba4e5d26c3139ffb7580
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
dbus-update-activation-environment --systemd --all &
systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &

#  ╔══════════════════════════════════════════════════════════╗
#  ║        Policy Authentication Agent (Gnome | KDE)         ║
#  ╚══════════════════════════════════════════════════════════╝
# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/polkit-kde-authentication-agent-1 & # authentication dialogue for GUI apps

#  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#  ┃                           BARS                           ┃
#  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
# waybar

#  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#  ┃                         Applets                          ┃
#  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
blueman-applet & # systray app for Bluetooth
killall udiskie
udiskie --no-automount --smart-tray & # front-end that allows to manage removable media
nm-applet --indicator &               # systray app for Network/Wifi

#  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#  ┃                      Notifications                       ┃
#  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
killall dunst
dunst &
killall swaync
# swaync &

#  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#  ┃                        Wallpaper                         ┃
#  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
#  swww

swww-daemon --format xrgb &
killall swww_randomize.sh
~/.config/scripts/swww_randomize.sh "$WALLPAPER_DIR" &

#  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#  ┃  OSD window for common actions like volume and capslock  ┃
#  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
# (https://github.com/ErikReider/SwayOSD)
# https://aur.archlinux.org/packages/swayosd-git
