#!/usr/bin/env bash
# CONNECTIONS
connInt=$(connmanctl technologies | grep "Connected = True" -B 3 | grep "Name" | awk -F" = " '{print $2}')

# ICONS
leftSep="$XDG_DATA_HOME/icons/bitmaps/22/left_cir.xbm"
rightSep="$XDG_DATA_HOME/icons/bitmaps/22/right_cir.xbm"
sepInt="$XDG_DATA_HOME/icons/bitmaps/22/sep_int.xbm"
leftSepAlt="$XDG_DATA_HOME/icons/bitmaps/22/left_sep_alt.xbm"
rightSepAlt="$XDG_DATA_HOME/icons/bitmaps/22/right_sep_alt.xbm"
eth="$XDG_DATA_HOME/icons/bitmaps/22/eth.xbm"
powerBtn="$XDG_DATA_HOME/icons/bitmaps/22/power_btn.xbm"

# THEME
bg="#1a1b26"
fg="#c0caf5"
bga="#33467c"
black="#15161e"
red="#f7768e"
green="#9ece6a"
yellow="#e0af68"
blue="#7aa2f7"
magenta="#bb9af7"
cyan="#7dcfff"
white="#a9b1d6"
gray="#414868"
font="Mononoki Nerd Font:style=bold"

maxWidth=$(herbstclient get_attr monitors.0.geometry | awk -Fx '{print $1}')
dateBlockWidth=390
tagsBlockWidth=240
# BLOCK
time_block() {
	align=$((($maxWidth - $tagsBlockWidth) / 2 - ($dateBlockWidth / 2)))
	timeCmd=$(date +'%a %d de %b %H:%M')
	echo "^p($align)^fg($red)^i($leftSep)^bg($bg)^fg($red)$timeCmd^fg($bg)^bg()^i($rightSep)^fg()^p()"
}
tags_block() {
	local lastTag=$(expr $(herbstclient attr tags.count) - 1)
	for i in $(seq 0 $lastTag); do
		local clientCount=$(herbstclient attr tags.$i.client_count)
		local tagName=$(herbstclient attr tags.$i.name)
		local focus=$(herbstclient attr tags.focus.index)
		if [ $i -eq $focus ]; then
			if [ $i -eq 0 ]; then
				tags="^bg($black)^fg($green)^i($leftSep)^bg($green)^fg($bg)$tagName "
			elif [ $i -eq $lastTag ]; then
				tags="$tags^bg($green)^fg($bg) $tagName^fg($green)^bg($black)^i($rightSep)"
			else
				tags="$tags^bg($green)^fg($bg) $tagName "
			fi
		elif [ $clientCount -gt 0 ]; then
			if [ $i -eq 0 ]; then
				tags="^bg($black)^fg($bg)^i($leftSep)^bg($bg)^fg($cyan)$tagName^fg($bg) "
			elif [ $i -eq $lastTag ]; then
				tags="$tags^bg($bg)^fg($cyan) $tagName^fg($bg)^bg($black)^i($rightSep)"
			else
				tags="$tags^bg($bg)^fg($cyan) $tagName^fg($bg) "
			fi
		else
			if [ $i -eq 0 ]; then
				tags="^bg($black)^fg($bg)^i($leftSep)^bg($bg)^fg($green)$tagName^fg() "
			elif [ $i -eq $lastTag ]; then
				tags="$tags^bg($bg)^fg($green) $tagName^fg($bg)^bg($black)^i($rightSep)"
			else
				tags="$tags^bg($bg)^fg($green) $tagName^fg($bg) "
			fi
		fi
	done
	echo "$tags^fg()^bg()"
}
while true; do
	echo "$(tags_block)$(time_block)"
done | dzen2 -p -h 22 -bg $black -fg $fg -fn "$font" -ta l
