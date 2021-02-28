#!/bin/bash

BACKUP_HOME="/media/roman/CPBA_X64FRE1/backup_HOME"
NOW=$(date +%Y-%m-%d-%H-%M)
MNOW=$(date +%Y-%m)

## 1-7
DAY_OF_WEEK=$(date +"%u") 

# 1-4
WEEK_OF_MONTH=$((($(date +%-d)-1)/7+1))
PREV_WEEK_OF_MONTH=$(((($(date +%-d)-1)/7+1)-1))

CURRENT_WEEK_DIR=${BACKUP_HOME}/${MNOW}-${WEEK_OF_MONTH}_WEEK

VARIABLES_FILE_SOURCE=${HOME}/.variables
VARIABLES_FILE_DEST=${CURRENT_WEEK_DIR}/.variables

EMAIL="volkovsws"

if [ $PREV_WEEK_OF_MONTH -eq 0 ] 

then 
	PREV_WEEK_OF_MONTH=4
fi



function processing_backup {

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
	-z --create --file $BACKUP_HOME/${MNOW}-${WEEK_OF_MONTH}_WEEK/$NOW.tar.gz \
	--listed-incremental=$BACKUP_HOME/${MNOW}-${WEEK_OF_MONTH}_WEEK/${WEEK_OF_MONTH}_WEEK.snar \
	--absolute-names /home/roman 
}

function create_backup_dir {

	mkdir -p ${BACKUP_HOME}/${MNOW}-${WEEK_OF_MONTH}_WEEK

}

function delete_old_backup_dir {

	rm -rf $BACKUP_HOME/${MNOW}-${PREV_WEEK_OF_MONTH}_WEEK
}

function copy_variables_file {

	cp $VARIABLES_FILE_SOURCE $VARIABLES_FILE_DEST
}

if [ $DAY_OF_WEEK -eq 1 ] 	
then
	if [ ! -d "$CURRENT_WEEK_DIR" ]
	then
		printf "Warning!!! Current dir for week backup not exist\n"
		create_backup_dir
	fi

	processing_backup
	delete_old_backup_dir

fi

if [ ! -d "$CURRENT_WEEK_DIR" ]
then
	printf "Warning!!! Current dir for week backup not exist\n"
	create_backup_dir
fi
	
processing_backup
copy_variables_file


#if [ $(ls -d $BACKUP_HOME/*.tar.gz 2> /dev/null | wc -l) != "0" ]
#then
#  gpg -r $EMAIL --encrypt-files $BACKUP_HOME/*.tar.gz \
##    && rm -rf /mnt/bu/backup/*.tar.gz
#fi

## scp -P port /mnt/bu/backup/$NOW.tar.gz.gpg /mnt/bu/backup/$MNOW.snar user@ip:/mnt/media/backup/x1arch