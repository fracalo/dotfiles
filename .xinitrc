
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

# exec xterm

# source our keymap with Esc and Caps switched
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
