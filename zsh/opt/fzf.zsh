# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */usr/local/opt/fzf/man* && -d "/usr/local/opt/fzf/man" ]]; then
  export MANPATH="$MANPATH:/usr/local/opt/fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

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

