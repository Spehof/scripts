#!/bin/sh

# Open dir from dir.conf using dmenu

DIR_CONF_PATH=~/.config/acess.conf/dir.conf

cat $DIR_CONF_PATH | sed -e '/^$/d' -e 's/#.*//' | dmenu -l 20 | sed 's/.*     \+//' | sh