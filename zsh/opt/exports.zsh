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


###################
### Dracula FZF ###
#################$$
if type fzf > /dev/null; then
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
  [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
  export FZF_DEFAULT_COMMAND='ag -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  __gen_fzf_default_opts() {

    local color00='#282a36'
    local color01='#3a3c4e'
    local color02='#626483'
    local color03='#4d4f68'
    local color04='#62d6e8'
    local color05='#e9e9f4'
    local color06='#f1f2f8'
    local color07='#f7f7fb'
    local color08='#ea51b2'
    local color09='#b45bcf'
    local color0A='#ebff87'
    local color0B='#00f769'
    local color0C='#a1efe4'
    local color0D='#62d6e8'
    local color0E='#b45bcf'
    local color0F='#00f769'

    export FZF_DEFAULT_OPTS="
      --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
      --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
      --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
    "
  }
  __gen_fzf_default_opts
fi
