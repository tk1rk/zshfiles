#!/usr/bin/env zsh
# XDG Base Directory Specification
# http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export ZSH_CONFIG="$XDG_CONFIG_HOME/zsh"
export ZSH_CUSTOM="$XDG_CONFIG_HOME/zsh/custom"
export ZSH_CACHE="$XDG_CACHE_HOME/zsh"
mkdir -p {$ZSH_CACHE,$ZSH_CUSTOM}

# executable search path
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/sbin:$PATH

export DATE=$(date +%Y-%m-%d)

# https://github.com/mxcl/homebrew/issues/11182
# export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export PYTHON_CONFIGURE_OPTS="--enable-framework"

### Path ###
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin:$HOME/.local/share:$HOME/.cargo/bin:$HOME/.cargo/env:$PATH"

### EDITOR ###
export EDITOR="nvim"
export VISUAL="$EDITOR"
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias nv="nvim"
alias n="nvim"

### TERMINAL ###
export TERM="xterm-256color"
export COLORTERM="truecolor"

### LANG ###
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

### enhancd ###
export ENHANCD_FILTER='fzf:fzy:peco'

# Less/Pager
export PAGER='less -R'
export LESS='-F -g -i -M -R -S -w -X -z-4 -~ --mouse'
export LESS_TERMCAP_mb=$'\E[6m'     # begin blinking
export LESS_TERMCAP_md=$'\E[34m'    # begin bold
export LESS_TERMCAP_us=$'\E[4;32m'  # begin underline
export LESS_TERMCAP_so=$'\E[0m'     # begin standout-mode (info box), remove background
export LESS_TERMCAP_me=$'\E[0m'     # end mode
export LESS_TERMCAP_ue=$'\E[0m'     # end underline
export LESS_TERMCAP_se=$'\E[0m'     # end standout-mode
export WORDCHARS='~!#$%^&*(){}[]<>?.+;'  # sane moving between words on the prompt
export GPG_TTY='$(tty)'
