###############
### EXPORTS ###
###############
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

### LANG ###
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

### enhancd ###
export ENHANCD_FILTER=fzf:fzy:peco

# Less/Pager
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4 -~ --mouse'
export LESS_TERMCAP_mb=$'\E[6m'     # begin blinking
export LESS_TERMCAP_md=$'\E[34m'    # begin bold
export LESS_TERMCAP_us=$'\E[4;32m'  # begin underline
export LESS_TERMCAP_so=$'\E[0m'     # begin standout-mode (info box), remove background
export LESS_TERMCAP_me=$'\E[0m'     # end mode
export LESS_TERMCAP_ue=$'\E[0m'     # end underline
export LESS_TERMCAP_se=$'\E[0m'     # end standout-mode
export MANPAGER="nvim -c 'set ft=man' -"
export WORDCHARS='~!#$%^&*(){}[]<>?.+;'  # sane moving between words on the prompt
export GPG_TTY=$(tty)

