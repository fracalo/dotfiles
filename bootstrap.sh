#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

backupdir_store="$HOME/.dotfile_backups"
backupdir="$backupdir_store/$(date '+%Y-%m-%d__%H_%M_%S')"

function backupFileIfExists() {
    filename="$1"
    prevname="$HOME/$filename"
  
    cp -RfL $prevname $backupdir 2>>/dev/null
    rm -r $prevname
}

function rotate {
    #files_to_delete=$(ls -1tr $backupdir_store | ghead -n -5)
    files_to_delete=$(ls -1tr $backupdir_store | head -n -5)
    for x in $files_to_delete; do
        rm -rf $backupdir_store/$x
    done
}

function doIt() {
    mkdir -p $backupdir
    for x in $(
        find . -maxdepth 1 -mindepth 1  | \
           xargs basename -a | \
           egrep -v '.git$' | \
           egrep -v '.*sh$' | \
           grep -v 'macos' | \
           grep -v 'README.md' | \
           grep -v 'junk'
        ); do 
       backupFileIfExists $x 

       #cp -R $x $HOME
       ln -Fs $(pwd)/$x $HOME
    done

    rotate # backups
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
    echo "This script will remove all colliding files in $HOME,"
    echo "proceeding a backup will be attempted at $backupdir." 
	read -p "Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
