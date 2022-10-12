#!/bin/bash
 
usage(){
  echo "usage:   ./crypt.sh [open|close] <encrypted_dev>"
}

OP=$1
TARGET=$2

# we bail out in case no first argument is passed
if [[ $OP != 'close' ]] && [[ $OP != 'open' ]]; then
  usage
  echo "Exiting: first argument must be either 'lock' or 'unlock'."
  exit
fi

# we bail out in case no second argument is passed
if [[ -z $TARGET ]]; then
  usage
  echo "Exiting: second argument must be the name of the entry in fstab."
  exit
fi

# our convention is to give fstab same name to fstab mount point (upperfirst) and crypttab name (lower)
# alternative MAPPDEV=$(echo $TARGET | tr '[A-Z]' '[a-z]')
MAPPDEV=$(echo $TARGET | awk '{print tolower($0)}')

ENCRYPTED_DEV=$(sudo grep -w $MAPPDEV /etc/crypttab)

# we bail out if we don't match a device in crypttab
if [[ -z $ENCRYPTED_DEV ]]; then
  usage
  echo "Exiting: no device named $MAPPDEV found in crypttab."
  exit
fi

SEC_FIELD=$( echo $ENCRYPTED_DEV | sed -r 's/\s+/ /g' | cut -d' ' -f2)

# now we have all the info,
# depending on $OP (operation mode we decide what to do)
if [[ $OP == 'close' ]]; then
  sudo umount /$TARGET
  sudo cryptsetup luksClose $MAPPDEV
  exit
fi

# if we get here we need to open and mount
sudo cryptsetup luksOpen $SEC_FIELD $MAPPDEV
sudo mount /$TARGET


