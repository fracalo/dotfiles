
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

# exec xterm

#.modmapscript switches keyboard layout through xmodmap
#please make sure it's executable by user in dotfiles/.xmodmapscript
[[ -f ~/.xmodmapscript ]] && . ~/.xmodmapscript
