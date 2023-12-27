# /usr/bin/bash
XDG_HOME_CONFIG="$HOME/.config/"
for i in `ls`; do
  cp -r $i $XDG_HOME_CONFIG 
done
