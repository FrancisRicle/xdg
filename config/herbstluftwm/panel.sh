#!/usr/bin/env bash
# CONNECTIONS
connInt=$(connmanctl technologies | grep "Connected = True" -B 3 | grep "Name" | awk -F" = " '{print $2}')



# ICONS
leftSep="$XDG_DATA_HOME/icons/bitmaps/22/left_sep.xbm"
rightSep="$XDG_DATA_HOME/icons/bitmaps/22/right_sep.xbm"
leftSepAlt="$XDG_DATA_HOME/icons/bitmaps/22/left_sep_alt.xbm"
rightSepAlt="$XDG_DATA_HOME/icons/bitmaps/22/right_sep_alt.xbm"
eth="$XDG_DATA_HOME/icons/bitmaps/22/eth.xbm"

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

# BLOCK
full_block(){
  echo "^fg($1)^i($leftSep)^bg($1)^fg($2)$3^fg($1)^bg()^i($rightSep)^fg()"
}
left_block(){
  echo "^bg($1)^fg($2)$3^bg()^fg($1)^i($rightSep)^fg()"
}
right_block(){
  echo "^p(+1920)^fg($1)^i($leftSep)^bg($1)^fg($2)$3^fg($1)^bg()^i($rightSep)^fg()^p()"
}
time_block(){
  full_block $red $black "$(date +'%a %d/%m/%Y %H:%M')"
}
tags_block(){
#  tags="^p(-$(expr $maxWidth / 2))"
  tags="^p(-1900)"
  lastTag=$(expr $(herbstclient attr tags.count ) - 1) 
  for i in {0..8} ;do
    if [ $(herbstclient attr tags.$i.client_count) -gt 0  ]; then
      tags=" $tags - $i "
    fi
  done
  echo "$tags^p()"
}
while true; do 
  echo $(time_block) $(tags_block)
  sleep 1s 
done | dzen2 -p -h 22 -bg $bg -fg $fg -ta c
