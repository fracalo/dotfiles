# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#add custom colors to prompt
function prompt
{
local WHITE="\[\033[1;37m\]"
local GREEN="\[\033[0;32m\]"
local BLUE="\[\033[0;34m\]"
local CYAN="\[\033[0;36m\]"
local GRAY="\[\033[0;37m\]"
local MAGENTA="\[\033[0;35m\]"
local YELLOW="\[\033[1;33m\]"
export PS1="${GREEN}\u${YELLOW}@${MAGENTA}\h ${YELLOW}\w${GRAY}
$ "
}


if [ "$color_prompt" = yes ]; then
    prompt
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions are defined in .bash_aliases.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# export MSF_DATABASE_CONFIG=/usr/local/share/metasploit-framework/config/database.yml
# [[ -s '/home/tronki/.rvm/scripts/rvm' ]] && source '/home/tronki/.rvm/scripts/rvm'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting



#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

#add a folder for custom scripts
export PATH="$HOME/bin:$PATH"

#add yarn global
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#adding /questions/26582300/how-to-use-sbt-behind-authenticated-proxyx
#export JAVA_OPTS="$JAVA_OPTS -Dhttp.proxyHost=proxy -Dhttp.proxyPort=port -Dhttps.proxyHost=proxy -Dhttps.proxyPort=port"

# some git aliases taken from https://jonsuh.com/blog/git-command-line-shortcuts
if [ -f ~/.bash_git_aliases ]; then
    . ~/.bash_git_aliases
fi

# start off tmux by default
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi
