#!usr/bin/env zsh

# Helps zinit select correct remote binaries
case "$OSTYPE" in
  linux*) bpick='*((#s)|/)*(linux|musl)*((#e)|/)*' ;;
  darwin*) bpick='*(macos|darwin)*' ;;
  *) echo 'WARN: unsupported system -- some cli programs might not work' ;;
esac

### ZSH SOURCES ###
typeset -ga sources
sources+="$ZSH_CONFIG/functions.zsh"
sources+="$ZSH_CONFIG/aliases.zsh"
sources+="$ZSH_CONFIG/completion.zsh"
autoload -U colors
colors

typeset -F4 SECONDS=0
### Added by Zinit's installer              
if [[ ! -f $ZDOTDIR/zinit/bin/zinit.zsh ]]; then \      
    command mkdir -p "$ZDOTDIR/zinit/bin/" && command chmod g-rwX "$ZDOTDIR/zinit/bin/" \             
    command git clone https://github.com/zdharma-continuum/zinit "$ZDOTDIR/zinit/bin/zinit.git"
fi                                        

typeset -A ZINIT
ZINIT[HOME_DIR]=$ZINIT_HOME
ZINIT[ZCOMPDUMP_PATH]=$XDG_CACHE_HOME/zsh/zcompdump
ZINIT[COMPLETIONS_DIR]=$XDG_CACHE_HOME
source "$ZDOTDIR/zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk       

# Load a few important annexes, without Turbo -- this is currently required for annexes
zinit light-mode for \                     
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-submods \
    zdharma-continuum/zinit-annex-rust  
    
# Caches slow commands
zinit light NICHOLAS85/z-a-eval 

#####################
# PROMPT            #
#####################
zinit lucid for \
    as"command" from"gh-r" atinit'export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"' atload'eval "$(starship init zsh)"' bpick'*unknown-linux-gnu*' \
    starship/starship \
    
##########################
# OMZ Libs and Plugins   #
##########################
# IMPORTANT:
# Ohmyzsh plugins and libs are loaded first as some these sets some defaults which are required later on. Otherwise something will look messed up.
setopt promptsubst


# OMZL Shorthand Syntax
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::termsupport.zsh
zinit snippet OMZL::clipboard.zsh 
zinit snippet OMZL::compfix.zsh 
zinit snippet OMZL::completion.zsh 
zinit snippet OMZL::correction.zsh 
   atload"
      alias ..='cd ..'
      alias ...='cd ../..'
      alias .... = 'cd ../../..'
      alias ..... = 'cd ../../../..'" 
zinit snippet OMZL::directories.zsh 
zinit snippet OMZL::git.zsh 
zinit snippet OMZL::grep.zsh 
zinit snippet OMZL::key-bindings.zsh 
zinit snippet OMZL::spectrum.zsh 
zinit snippet OMZL::termsupport.zsh 

## omzp snippets
zinit snippet OMZP::extract
zinit snippet OMZP::git
zinit snippet OMZP::dotenv
zinit snippet OMZP::rake
zinit snippet OMZP::rbenv
zinit snippet OMZP::ruby
zinit snippet OMZP::


### Programs 
# doctoc
zinit pack for doctoc

# fzf
zinit pack for fzf

# ls_colors
zinit pack for ls_colors

# pyenv
zinit pack"bgn" git for pyenv

# sharkdp/fd
zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd

# sharkdp/bat
zinit ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

# ogham/exa, replacement for ls
zinit ice wait"2" lucid from"gh-r" as"program" mv"exa* -> exa"
zinit light ogham/exa

# All of the above using the for-syntax and also z-a-bin-gem-node annex
zinit wait"1" lucid from"gh-r" as"null" for \
     sbin"fzf"          junegunn/fzf-bin \
     sbin"**/fd"        @sharkdp/fd \
     sbin"**/bat"       @sharkdp/bat \
     sbin"exa* -> exa"  ogham/exa


zinit ice as"program" atclone"rm -f src/auto/config.cache; ./configure" \
    atpull"%atclone" make pick"src/nvim"
zinit light neovim/neovim

zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
    atpull'%atclone' pick"direnv" src"zhook.zsh" for \
        direnv/direnv

# Installation of Rust compiler environment via the z-a-rust annex
zinit id-as"rust" wait=1 as=null sbin="bin/*" lucid rustup \
    atload="[[ ! -f ${ZINIT[COMPLETIONS_DIR]}/_cargo ]] && zi creinstall -q rust; \
    export CARGO_HOME="$HOME/.cargo/env"; export RUSTUP_HOME=\$PWD/rustup" for \
        zdharma-continuum/null

# Handle completions without loading any plugin, see "clist" command.
# This one is to be ran just once, in interactive session.
zinit creinstall %HOME/.zsh/cache/completions

### End of Zinit's installer chunk
