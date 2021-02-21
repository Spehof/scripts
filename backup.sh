#!/bin/bash

NOW=$(date +%Y-%m-%d-%H-%M)
MNOW=$(date +%Y-%m)

BACKUP_HOME="/media/roman/CPBA_X64FRE1"
EMAIL="volkovsws"
ARCHIVES_DIR="$BACKUP_HOME/archives"


tar \
--exclude='/home/roman/.dropbox-dist' \
--exclude='/home/roman/Dropbox' \
--exclude='/home/roman/Downloads' \
--exclude='/home/roman/.cache' \
--exclude='/home/roman/.dropbox' \
--exclude='/home/roman/Desktop' \
--exclude='/home/roman/.android' \
--exclude='/home/roman/.cache' \
--exclude='/home/roman/.local/share/Trash' \
-z --create --file $BACKUP_HOME/$NOW.tar.gz \
--listed-incremental=$BACKUP_HOME/$MNOW.snar /home/roman 

#if [ $(ls -d $BACKUP_HOME/*.tar.gz 2> /dev/null | wc -l) != "0" ]
#then
#  gpg -r $EMAIL --encrypt-files $BACKUP_HOME/*.tar.gz \
##    && rm -rf /mnt/bu/backup/*.tar.gz
#fi

## scp -P port /mnt/bu/backup/$NOW.tar.gz.gpg /mnt/bu/backup/$MNOW.snar user@ip:/mnt/media/backup/x1arch