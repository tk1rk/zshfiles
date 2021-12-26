#!/bin/zsh                                                                                               
                                                                                                                                                                                               
# XDG Base Directory Specification
# http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME="$HOME/.cache"
export ZSH_CONFIG="$XDG_CONFIG_HOME/.zsh"
export ZSH_CUSTOM="$XDG_CONFIG_HOME/.zsh/custom"
export ZSH_CACHE="$XDG_CACHE_HOME/zsh"
mkdir -p {$ZSH_CACHE,$ZSH_CUSTOM}

# install bat-cat-git 
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# starship config
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
                                                                                                                                                       
# home                                                                                                                                                                         
export HOME="/home/tk"                                                                                  
                                                                                                                                                                                                                                                                                                                                                                                                                       
# editor                                                                                                 
export EDITOR="nvim"                                                                                     
export VISUAL="nvim"
export VIMCONFIG="$XDG_CONFIG_HOME/nvim"                                                                         

# history                                                                                                         
export HISTSIZE=10000                   # Maximum events for internal history                            
export SAVEHIST=10000                  

# time
export DATE=$(date +%Y-%m-%d)

# https://github.com/mxcl/homebrew/issues/11182
# export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export PYTHON_CONFIGURE_OPTS="--enable-framework"

### Path ###
export PATH="/usr/bin:/bin:/usr/sbin:$HOME/.local/sbin:/sbin:$HOME/.local/bin:$HOME/.local/share:$HOME/.cargo/bin:$HOME/.cargo/env:$PATH"

### EDITOR ###
export EDITOR="nvim"
export VISUAL="nvim"

### TERMINAL ###
export TERM="xterm-256color"
export COLORTERM="truecolor"

### LANG ###
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

### enhancd ###
export ENHANCD_FILTER="fzf:fzy:peco"

# Less/Pager
export PAGER="less -R"
export LESS="-R"
export LESS_TERMCAP_mb=$'\E[6m'     # begin blinking
export LESS_TERMCAP_md=$'\E[34m'    # begin bold
export LESS_TERMCAP_us=$'\E[4;32m'  # begin underline
export LESS_TERMCAP_so=$'\E[0m'     # begin standout-mode (info box), remove background
export LESS_TERMCAP_me=$'\E[0m'     # end mode
export LESS_TERMCAP_ue=$'\E[0m'     # end underline
export LESS_TERMCAP_se=$'\E[0m'     # end standout-mode
export WORDCHARS='~!#$%^&*(){}[]<>?.+;'  # sane moving between words on the prompt
export GPG_TTY='$(tty)'
