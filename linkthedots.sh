#!/usr/bin/env bash

# .dotfiles
# this is a minimal script for symlinking files in .dotfile dir
# to the appropiate location

SCRIPT_PATH=$(readlink -f ${BASH_SOURCE[0]})
DOTFILE_DIR=`dirname $SCRIPT_PATH`

declare -a LIST_DOT

rotate() {
  
  if [ ! -L $HOME/$1 ] || [ $(readlink -f $HOME/$1) != $DOTFILE_DIR/$1 ]; then
  # do rotation
    for i in {8..0}; do
      if [ -f $HOME/$1.bak.$i ]; then
        mv $HOME/$1.bak.$i $HOME/$1.bak.$((i+1))
      fi
    done
    mv $HOME/$1 $HOME/$1.bak.0
    echo "your $1 file has been backuped to $HOME/${1}.bak.0"
  else # in case it's a link to same file we just erase it
    rm $HOME/$1
  fi
    
}

while read -rd ''; do
    if [ -f $HOME/$(basename $REPLY) ]; then
      rotate $(basename $REPLY)
    fi
    ln -s $REPLY $HOME
done < <(find ${DOTFILE_DIR} ! -path ${DOTFILE_DIR}  ! -name '*.sh' ! -regex ".*/.git.*" -print0) 
