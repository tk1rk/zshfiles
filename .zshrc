#!/usr/bin/env zsh

### Added by Zinit's installer              
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then \                      
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"  \               
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit" \             
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \           
    print -P "%F{33} %F{34}Installation successful.%f%b" || \              
    print -P "%F{160} The clone has failed.%f%b"                              
fi                                        

source "$HOME/.zinit/bin/zinit.zsh"
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
# junegunn/fzf-bin
zinit pack for \
    doctoc \
    fzf \
    ls_colors \

# sharkdp/fd
zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd

# sharkdp/bat
zinit ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

# ogham/exa, replacement for ls
zinit ice wait"2" lucid from"gh-r" as"program" mv"exa* -> exa"
zinit light ogham/exa

# lsd
zinit ice wait"2" lucid from"gh-r" as"propgram" mv"lsdb:nn *

# All of the above using the for-syntax and also z-a-bin-gem-node annex
zinit wait"1" lucid from"gh-r" as"null" for \
     sbin"fzf"          junegunn/fzf-bin \
     sbin"**/fd"        @sharkdp/fd \
     sbin"**/bat"       @sharkdp/bat \
     sbin"exa* -> exa"  ogham/exa

# jarun/nnn, a file browser, using the for-syntax
zinit pick"misc/quitcd/quitcd.zsh" sbin make light-mode for \
    jarun/nnn

zinit ice as"program" atclone"rm -f src/auto/config.cache; ./configure" \
    atpull"%atclone" make pick"src/nvim"
zinit light neovim/neovim

zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
    atpull'%atclone' pick"direnv" src"zhook.zsh" for \
        direnv/direnv
  
zinit ice as"program" pick"$ZPFX/sdkman/bin/sdk" id-as"sdkman" run-atpull \
    atclone"wget https://get.sdkman.io/?rcupdate=false -O scr.sh; SDKMAN_DIR=$ZPFX/sdkman bash scr.sh" \
    atpull"SDKMAN_DIR=$ZPFX/sdkman sdk selfupdate" \
    atinit"export SDKMAN_DIR=$ZPFX/sdkman; source $ZPFX/sdkman/bin/sdkman-init.sh" \
zinit light zdharma-continuum/null

# Installation of Rust compiler environment via the z-a-rust annex
zinit id-as"rust" wait=1 as=null sbin="bin/*" lucid rustup \
    atload="[[ ! -f ${ZINIT[COMPLETIONS_DIR]}/_cargo ]] && zi creinstall -q rust; \
    export CARGO_HOME="$HOME/.cargo/env"; export RUSTUP_HOME=\$PWD/rustup" for \
        zdharma-continuum/null

# Handle completions without loading any plugin, see "clist" command.
# This one is to be ran just once, in interactive session.
zinit creinstall %HOME/.zsh/cache/completions

# Load starship theme
zinit ice as"command" from"gh-r" \ 
  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \ 
  atpull"%atclone" src"init.zsh" 
zinit light starship/starship
### End of Zinit's installer chunk
