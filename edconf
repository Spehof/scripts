#!/bin/sh

# Edit Config
# Script for quick acess to configs (dotfiles, etc)

CONF_PATH=~/.config/acess.conf/conf.conf

cat $DIR_CONF_PATH | sed -e '/^$/d' -e 's/#.*//' | dmenu -l 20 | sed 's/.*     \+//' | sh