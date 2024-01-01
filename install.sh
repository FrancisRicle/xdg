# /usr/bin/bash
for i in $(ls config); do
	cp -r "./config/$i" $XDG_CONFIG_HOME
done
for i in $(ls data); do
	cp -r "./data/$i" $XDG_DATA_HOME
done
