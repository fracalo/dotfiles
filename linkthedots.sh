#!/usr/local/bin/bash

# .dotfiles
# this is a minimal script for symlinking files in .dotfile dir
# to the appropiate location

#SCRIPT_PATH=$(readlink -f ${BASH_SOURCE[0]}) on osx this don't work
# so you'll need to install coreutils  (which give mac Gnu coreutilities such as readlink)
# g as GNU !!
SCRIPT_PATH=$(greadlink -f ${BASH_SOURCE[0]})
DOTFILE_DIR=`dirname $SCRIPT_PATH`
DOTFILE_DIR_STR=$DOTFILE_DIR
DOTFILE_DIR_LEN=${#DOTFILE_DIR_STR}
# declare -a LIST_DOT

rotate() {
  
  if [ ! -L $HOME$1 ] || [ $(greadlink -f $HOME$1) != $DOTFILE_DIR$1 ]; then
  # do rotation
    for i in {8..0}; do
      if [ -f $HOME$1.bak.$i ]; then
        mv $HOME$1.bak.$i $HOME$1.bak.$((i+1))
      fi
    done
    mv $HOME$1 $HOME$1.bak.0
    echo "your $1 file has been backuped to $HOME${1}.bak.0"
  else # in case it's a link to same file we just erase it
    rm $HOME$1
  fi
}

echo find ${DOTFILE_DIR} ! -path ${DOTFILE_DIR}  ! -name '*.sh' ! -regex ".*/.git.*" -print0
while read -rd ''; do
    REL_PATH=${REPLY:$DOTFILE_DIR_LEN}
    if [ -d $REPLY ]; then
      mkdir -p $HOME$REL_PATH
      continue
    fi
    if [ -f $HOME$REL_PATH ]; then
      rotate $REL_PATH
    fi
    ln -s $REPLY $HOME$(dirname $REL_PATH)
done < <(find ${DOTFILE_DIR} ! -path ${DOTFILE_DIR}  ! -name '*.sh' ! -regex ".*/.git.*" -print0) 
