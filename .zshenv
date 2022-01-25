#!/usr/bin/env zsh     

# Base zshenv delegates to files in $ZDOTDIR

export ZDOTDIR=$HOME/.zsh
[ -f $ZDOTDIR/.zshenv ] && . $ZDOTDIR/.zshenv
