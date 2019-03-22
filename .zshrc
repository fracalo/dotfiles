
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Vi mode to activate vi mode in spaceship bindkey doesn't work , we use spaceship_vi_mode_enable
# bindkey -v
export KEYTIMEOUT=1

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# add aws cli...
export PATH=~/.local/bin:$PATH

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# adding nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# ORDER
SPACESHIP_PROMPT_ORDER=(
  time
  user
  host
  dir
  git
  hg
  package
  node
  ruby
  elixir
  xcode
  swift
  golang
  php
  rust
  julia
  docker
  aws
  venv
  pyenv
  dotnet
  ember
  exec_time
  line_sep
  vi_mode
  jobs
  exit_code
  char
  )
# HOST
# Result will look like this:
#   username@:(hostname)
SPACESHIP_USER_SHOW='true'
SPACESHIP_USER_PREFIX="with "
SPACESHIP_USER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_USER_COLOR="yellow"
SPACESHIP_USER_COLOR_ROOT="red"

SPACESHIP_HOST_SHOW=true
SPACESHIP_HOST_PREFIX="@:("
SPACESHIP_HOST_SUFFIX=") " 
SPACESHIP_HOST_COLOR="green"

SPACESHIP_VI_MODE_SHOW=true
SPACESHIP_VI_MODE_COLOR=purple

#enabling vi mode here
spaceship_vi_mode_enable

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#add a folder for custom scripts
PATH="$HOME/bin:$PATH"
#
#add yarn global path
PATH="$HOME/.yarn/bin:$PATH"

#add .yarn/bin
PATH="$HOME/.yarn/bin:$PATH"

source "/home/frank/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

# adding some git aliases
[ -f "$HOME/.aliases_git" ] && \. "$HOME/.aliases_git"

VISUAL="nvim"

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
