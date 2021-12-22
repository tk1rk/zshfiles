#!/bin/zsh

### ZSH_CACHE_DIR ### 
if [[ -z "$ZSH_CACHE_DIR" ]]; then
  ZSH_CACHE_DIR="$ZSH_CONFIG/cache"
fi

### Make sure $ZSH_CACHE_DIR is writable
if [[ ! -w "$ZSH_CACHE_DIR" ]]; then
  ZSH_CACHE_DIR="$ZSH_CONFIG/.cache/"
fi

### Create cache and completions dir and add to $fpath ###
mkdir -p "$ZSH_CACHE_DIR/completions"
(( ${fpath[(Ie)"$ZSH_CACHE_DIR/completions"]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)

### Load all stock functions (from $fpath files) ###
autoload -U compaudit compinit

### ZSH_CUSTOM ###
# and plugins exists, or else we will use the default custom/
if [[ -z "$ZSH_CUSTOM" ]]; then
    ZSH_CUSTOM="$ZSH_CONFIG/custom"
fi

### Add all defined plugins to fpath. This must be done ###
### before running compinit. ###
for plugin ($plugins); do
  if is_plugin $ZSH_CUSTOM $plugin; then
    fpath=($ZSH_CUSTOM/plugins/$plugin $fpath)
  elif is_plugin $ZSH $plugin; then
    fpath=($ZSH/plugins/$plugin $fpath)
  fi
done

### ZCOMP ###
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# fish like Auto suggestion
autoload predict-on
predict-toggle() {
  ((predict_on=1-predict_on)) && predict-on || predict-off
}
zle -N predict-toggle
bindkey '^Z'   predict-toggle
zstyle ':predict' toggle true
zstyle ':predict' verbose true

### ZSH SOURCES ###
typeset -ga sources
sources+="$ZSH_CONFIG/opt/environment.zsh"
sources+="$ZSH_CONFIG/functions.zsh"
sources+="$ZSH_CONFIG/aliases.zsh"
sources+="$ZSH_CONFIG/auto-color-ls.zsh"
sources+="$ZSH_CONFIG/bindkeys.zsh"

### command-not-found ###
sources+="/etc/zsh_command_not_found"

### git ###
sources+="$ZSH_CONFIG/opt/git.zsh"

### FASD ###
sources+="$ZSH_CONFIG/opt/fasd.zsh"

### fzf integration and config ###
sources+="$ZSH_CONFIG/opt/fzf.zsh"         

### AUTOSUGGESTIONS, TRIGGER PRECMD HOOK UPON LOAD ###
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

### load url-quote-magic and bracketed-paste-magic ###
autoload -U url-quote-magic bracketed-paste-magic
zle -N self-insert url-quote-magic
zle -N bracketed-paste bracketed-paste-magic

Add new Zsh Completions repo
fpath=(~/.zsh/completions/src $fpath)

# Unfortunately, ^L makes the first line disappear. We can fix that by making
# our own clear-screen function.
clear-screen-and-precmd() {
  clear
  zle redisplay
  precmd
}
zle -N clear-screen-and-precmd

# This is the easiest way to get a newline. SRSLY.
local __newline="

# Unicode looks cool.
if [ "$EUID" = "0" ]; then
  __sigil="# "
elif `echo $LANG | grep -E -i 'utf-?8' &>/dev/null`; then
  __sigil="〉"
else
  __sigil="%# "
fi

if [ -n "$SUDO_USER" ]; then
  colorprompt '33;1'
else
  colorprompt
fi

# fzf via local installation
if [ -e ~/.fzf ]; then
  _append_to_path ~/.fzf/bin
  source ~/.fzf/shell/key-bindings.zsh
  source ~/.fzf/shell/completion.zsh
fi

# fzf/rg
if _has rg; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
fi


### Now the fix, setup these two hooks: ###
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# Load these ssh identities with the ssh module.
zstyle ':zim:ssh' ids 'id_rsa' 'id_ecdsa' 'id_ed25519'

### make sure zsh-autosuggestions does't interfere ###
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(expand-or-complete bracketed-paste accept-line push-line-or-edit)

### History Substring Search ###
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

### .dircolors ###
if whence dircolors >/dev/null; then
  eval "$(dircolors -b)"
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  alias ls='ls --color'
else
  export CLICOLOR=1
  zstyle ':completion:*' list-colors ''
fi

# add in zsh-completions
fpath = (/usr/share/zsh/zsh-completions $fpath)

autoload -Uz compinit
compinit -u

### BASH Completions ###
autoload -Uz compinit bashcompinit
compinit -u
bashcompinit -u

# Colors
autoload -U colors
colors

zmodload -i zsh/complist

###########
# HISTORY #
###########
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zhistory"
HISTSIZE=290000
SAVEHIST=$HISTSIZE


### Aliases ###
if [ -f ~/.aliases.zsh ]; then
    . ~/.aliases.zsh
fi

### Functions ###
if [ -f ~/.functions.zsh ]; then
    . ~/.functions.zsh
fi

###################
### Dracula Ra ###
######$$$$$$$$$$$$$

###############
### Sheldon ###
###############
eval "$(sheldon source)"

#############
### Cargo ###
#############
source $HOME/.cargo/env

################
### Starship ###
################
eval "$(starship init zsh)"

##############
### Zoxide ###
##############
eval "$(zoxide init zsh)"

################
### Neofetch ###
################
neofetch

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


