export MANPATH=/usr/share/man:/usr/local/share/man
export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin:$HOME/.local/share:$HOME/.cargo/bin:$HOME/.cargo/share:$HOME/.local/bin:$HOME/.local/share"
export LC_ALL = en_US.UTF-8
export LANG = en_US.UTF-8
export HISTFILE = "$HOME/.history"
export HISTSIZE = 10000
export SAVEHIST = 10000
export EDITOR = nvim
export VISUAL = nvim
export TERM = "xterm-256color"
export CLICOLOR=1
export LC_ALL = en_US.UTF-8
export LANG = en_US.UTF-8
eval "$(sheldon source)"

# Enable history appending instead of overwriting when exiting.  #139609
shopt -s histappend

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

autoload -U select-word-style
select-word-style bash

### dracula tty
if ["$TERM" = "xterm-256color"]; then
\nprintf %b '\e[40m' '\e[8]' # set default background to color 0 'dracula-bg'
\printf %b '\e[37m' '\e[8]' # set default foreground to color 7 'dracula-fg'
printf %b '\e]P0282a36'    # redefine 'black'          as 'dracula-bg'
printf %b '\e]P86272a4'    # redefine 'bright-black'   as 'dracula-comment'
printf %b '\e]P1ff5555'    # redefine 'red'            as 'dracula-red'
printf %b '\e]P9ff7777'    # redefine 'bright-red'     as '#ff7777'
printf %b '\e]P250fa7b'    # redefine 'green'          as 'dracula-green'
printf %b '\e]PA70fa9b'    # redefine 'bright-green'   as '#70fa9b'
printf %b '\e]P3f1fa8c'    # redefine 'brown'          as 'dracula-yellow'
printf %b '\e]PBffb86c'    # redefine 'bright-brown'   as 'dracula-orange'
printf %b '\e]P4bd93f9'    # redefine 'blue'           as 'dracula-purple'
printf %b '\e]PCcfa9ff'    # redefine 'bright-blue'    as '#cfa9ff'
printf %b '\e]P5ff79c6'    # redefine 'magenta'        as 'dracula-pink'
printf %b '\e]PDff88e8'    # redefine 'bright-magenta' as '#ff88e8'
printf %b '\e]P68be9fd'    # redefine 'cyan'           as 'dracula-cyan'
printf %b '\e]PE97e2ff'    # redefine 'bright-cyan'    as '#97e2ff'
printf %b '\e]P7f8f8f2'    # redefine 'white'          as 'dracula-fg'
printf %b '\e]PFffffff'    # redefine 'bright-white'   as '#ffffff'
clear
fi



force_color_prompt=yes
use_color=true
if type -P dircolors >/dev/null ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	LS_COLORS=
	if [[ -f ~/.dir_colors ]] ; then
		eval "$(dircolors -b ~/.dir_colors)"
	else
		eval "$(dircolors -b)"
	fi
	# Note: We always evaluate the LS_COLORS setting even when it's the
	# default.  If it isn't set, then `ls` will only colorize by default
	# based on file attributes and ignore extensions (even the compiled
	# in defaults of dircolors). #583814
	if [[ -n ${LS_COLORS:+set} ]] ; then
		use_color=true
	else
		# Delete it if it's empty as it's useless in that case.
		unset LS_COLORS
	fi
else
	# Some systems (e.g. BSD & embedded) don't typically come with
	# dircolors so we need to hardcode some terminals in here.
	case ${TERM} in
	[aEkx]term*|rxvt*|gnome*|konsole*|screen|tmux|cons25|*color) use_color=true;;
	esac
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

source /etc/bash_completion.d/git_status
source $HOME/.cargo/env

fastfetch
