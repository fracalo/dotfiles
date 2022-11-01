#!/usr/bin/env bash

## ./brew.sh
# switch back to zsh
## ./bootstrap.sh -f

#### tmux plugin manager
## git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#### nvim packer inside the .config
## git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.config/nvim/pack/packer/start/packer.nvim

#### oh-myzsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#### mv .zshrc back in proper position 
   
# ./macos

#### check support for truecolor
#### https://gist.github.com/XVilka/8346728
# echo 'testing truecolor'
# awk -v term_cols="${width:-$(tput cols || echo 80)}" 'BEGIN{
#     s="/\\";
#     for (colnum = 0; colnum<term_cols; colnum++) {
#         r = 255-(colnum*255/term_cols);
#         g = (colnum*510/term_cols);
#         b = (colnum*255/term_cols);
#         if (g>255) g = 510-g;
#         printf "\033[48;2;%d;%d;%dm", r,g,b;
#         printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
#         printf "%s\033[0m", substr(s,colnum%2+1,1);
#     }
#     printf "\n";
# }'


#### starship prompt
# curl -sS https://starship.rs/install.sh | sh

#### install fzf
# /opt/homebrew/opt/fzf/install
