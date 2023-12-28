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

# BLOCK
time_block(){
  align=`expr $maxWidth / 2 - $dateBlockWidth / 2`
  timeCmd=`date +'%a %d/%m/%Y %H:%M'`
  echo "^p(348)^fg($red)^i($leftSep)^bg($red)^fg($black)$timeCmd^fg($red)^bg()^i($rightSep)^fg()^p()"
}
tags_block(){
  lastTag=$(expr $(herbstclient attr tags.count ) - 1) 
  for i in `seq 0 $lastTag` ;do
    clientCount=`herbstclient attr tags.$i.client_count`
    tagName=`herbstclient attr tags.$i.name`
    if [ $clientCount -gt 0 ] && [ $i -gt 0 ] && [ $i -lt $lastTag ]; then 
      tags="$tags^fg($green)^i($leftSepAlt)^bg($green)^fg($black)$tagName"
    elif [ $clientCount -gt 0 ] && [ $i -gt 0 ] ; then
      tags="$tags^fg($green)^bg($cyan)^i($leftSepAlt)^bg($green)^fg($black)$tagName^fg($green)^bg()^i($rightSep)"
    elif [ $clientCount -gt 0 ]; then
      tags="$tags^bg($green)^fg($black) $tagName"
    elif [ $i -eq $lastTag ]; then
      tags="$tags^fg($cyan)^i($leftSepAlt)^bg($cyan)^fg($black)$tagName^fg($cyan)^bg()^i($rightSep)"
    elif [ $i -eq 0 ]; then
      tags="$tags^bg($cyan)^fg($black) $tagName"
    else
      tags="$tags^fg($cyan)^i($leftSepAlt)^bg($cyan)^fg($black)$tagName^fg($cyan)"
    fi
  done
  echo "$tags^fg()^bg()"
}
while true; do 
  echo "$(tags_block)$(time_block)"
  sleep 1s 
done | dzen2 -p -h 22 -bg $bg -fg $fg -fn "$font" -ta l
