#!/usr/bin/env zsh

#!/bin/zsh

# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

# Load a prompt
zcomet load 

# Load some plugins
zcomet load chrissicool/zsh-256color
zcomet load chrissicool/zsh-bash
zcomet load mafredri/zsh-async
zcomet load hchbaw/auto-fu.zsh
zcomet load redxtech/zsh-asdf-direnv
zcomet load mafredri/zsh-async
zcomet load skywind3000/z.lua
zcomet load ohmyzsh plugins/gitfast
zcomet load marlonrichert/zsh-autocomplete
zcomet load hlissner/zsh-autopair
zcomet load zuxfoucault/colored-man-pages_mod
zcomet load wookayin/fzf-fasd
zcomet load joshskidmore/zsh-fzf-history-search
zcomet load Aloxaf/fzf-tab
zcomet load larkery/zsh-histdb

#prompt
zcomet fpath romkatv/powerlevel10k
autoload promptinit; promptinit
prompt powerlevel10k

# Load a code snippet - no need to download an entire repo
zcomet snippet https://github.com/jreese/zsh-titles/blob/master/titles.plugin.zsh

# Lazy-load some plugins
zcomet trigger zhooks agkozak/zhooks
zcomet trigger zsh-prompt-benchmark romkatv/zsh-prompt-benchmark

# Lazy-load Prezto's archive module without downloading all of Prezto's
# submodules
zcomet trigger --no-submodules archive unarchive lsarchive \
    sorin-ionescu/prezto modules/archive

# It is good to load these popular plugins last, and in this order:
zcomet load zdharma-continuum/fast-syntax-highlighting
zcomet load zsh-users/zsh-autosuggestions
zcomet load zsh-users/zsh-history-substring-search

# Run compinit and compile its cache
zcomet compinit

#env
export ZSH_CONFIG="$HOME/.zsh"
export ZSH_CACHE_DIR="$HOME/.cache/zsh"

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
sources+="$ZSH_CONFIG/environment.zsh"
sources+="$ZSH_CONFIG/functions.zsh"
sources+="$ZSH_CONFIG/aliases.zsh"
sources+="$ZSH_CONF+!IG/auto-color-ls.zsh"
sources+="$ZSH_CONFIG/bindkeys.zsh"

### command-not-found ###
sources+="/etc/zsh_command_not_found"

# auto-fu
export A="$HOME/.zsh/auto-fu.zsh"
zsh -c "source $A ; auto-fu-zcompile $A ~/.zsh"

### git ###
sources+="$ZSH_CONFIG/git.zsh"

### FASD ###
sources+="$ZSH_CONFIG/fasd.zsh"

### fzf integration and config ###
sources+="$ZSH_CONFIG/fzf.zsh"         

### AUTOSUGGESTIONS, TRIGGER PRECMD HOOK UPON LOAD ###
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

### load url-quote-magic and bracketed-paste-magic ###
autoload -U url-quote-magic bracketed-paste-magic
zle -N self-insert url-quote-magic
zle -N bracketed-paste bracketed-paste-magic

# Add new Zsh Completions repo
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

### .dircolors ###
if whence dircolors >/dev/null; then
  eval "$(dircolors -b)"
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  alias ls='lsd -la'

else
  export CLICOLOR=1
  zstyle ':completion:*' list-colors ''
fi

# Colors
autoload -U colors
colors

### Aliases ###
if [ -f ~/.aliases.zsh ]; then
    . ~/.aliases.zsh
fi

### Functions ###
if [ -f ~/.functions.zsh ]; then
    . ~/.functions.zsh
fi

###################
### Dracula Ranger ####
###################

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


