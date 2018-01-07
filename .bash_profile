#
# ~/.bash_profile
#

PATH=~/bin:$PATH


[[ -f ~/.bashrc ]] && . ~/.bashrc

#.modmapscript switches keyboard layout through xmodmap
#please make sure it's executable by user in dotfiles/.xmodmapscript
[[ -f ~/.xmodmapscript ]] && . ~/.xmodmapscript
