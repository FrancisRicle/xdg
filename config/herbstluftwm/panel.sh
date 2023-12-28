#!/usr/bin/env bash
# CONNECTIONS
connInt=$(connmanctl technologies | grep "Connected = True" -B 3 | grep "Name" | awk -F" = " '{print $2}')



# ICONS
leftSep="$XDG_DATA_HOME/icons/bitmaps/22/left_sep.xbm"
rightSep="$XDG_DATA_HOME/icons/bitmaps/22/right_sep.xbm"
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
font="Terminess Nerd Font:style=bold"

maxWidth=$(herbstclient get_attr monitors.0.geometry | awk -Fx '{print $1}')
dateBlockWidth=390
tagsBlockWidth=410
# BLOCK
time_block(){
  align=$((($maxWidth - $tagsBlockWidth) / 2 - ($dateBlockWidth/ 2))) 
  timeCmd=`date +'%a %d/%m/%Y %H:%M'`
  echo "^p($align)^fg($red)^i($leftSep)^bg($red)^fg($black)$timeCmd^fg($red)^bg()^i($rightSep)^fg()^p()"
}
tags_block(){
  lastTag=$(expr $(herbstclient attr tags.count ) - 1) 
  for i in `seq 0 $lastTag` ;do
    clientCount=`herbstclient attr tags.$i.client_count`
    tagName=`herbstclient attr tags.$i.name`
    focus=`herbstclient attr tags.focus.index`
    tags="$tags$(echo "$i;$tagName;$clientCount;$focus;$cyan;$green;$bg;$rightSep" | $XDG_CONFIG_HOME/herbstluftwm/tags_panel.py)"
  done
  echo "$tags^fg()^bg()"
}
while true; do 
  echo "$(tags_block)$(time_block)"
done | dzen2 -p -h 22 -bg $bg -fg $fg -fn "$font" -ta l
