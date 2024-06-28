#!/bin/sh
export TERMINAL=st
export BROWSER="flatpak run io.github.ungoogled_software.ungoogled_chromium"
pulseaudio --start
setxkbmap latam
feh --bg-max --randomize ~/.wallpapers/* &
exec dbus-launch --exit-with-session herbstluftwm
