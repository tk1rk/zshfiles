#!/bin/zsh

# Load more completions
fpath=($DOTFILES/zsh/plugins/zsh-completions/src $fpath)

# Should be called before compinit
zmodload zsh/complist

# file info with long listing (like ls -l)
zmodload -i zsh/stat
disable stat

# compinstall
autoload -U compinstall
compinstall

# 
autoload -Uz compinit bashcompinit
compinit 
bashcompinit
_comp_options+=(globdots)

a# cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' keep-prefix true

zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# matches patial words
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# rehash if command not found (possibly recently installed)
zstyle ':completion:*' rehash true

# verbose
zstyle ':completion:*' verbose yes

# menu if nb items > 2
zstyle ':completion:*' menu select=0

# completer
zstyle ':completion:*' complete-options true

zstyle ':completion:*' completer _expand _oldlist _extensions _complete _match _ignored _correct _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals.*' insert-sections true
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' max-errors 5

zstyle ':completion:*:man:*' menu yes select
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*' use-perl true
zstyle :compinstall filename '/home/tk/.zshrc'

# Ignore useless files, like .pyc.
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/).pyc'

# Completing process IDs with menu selection.
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

source /etc/bash_completion
