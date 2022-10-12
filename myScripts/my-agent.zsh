#!/bin/zsh
#need to be read from shell
# ex: ./bin/my-agents.zsh

# create an array with all the keyfile in $HOME/.ssh
karr=()
sshdir="$HOME/.ssh"
for f in "$sshdir"/*; do
  file=$(basename $f)
  if [[ $file =~ "\.pub$" ]]; then
    continue
  fi
  karr+=($file)
done


# select one
printf "Please select the key to add:\n"

select k in $karr
do
  test -n "$k" && break;
    echo ">>> Invalid Selection";
done

# prompt pass
echo "\n\n"

###ssh-agent
ssh-add $sshdir/$k
