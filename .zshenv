                                                                                                         
                                                                                                         
###############################                                                                          
# EXPORT ENVIRONMENT VARIABLE #                                                                          
###############################                                                                          
#!/bin/zsh                                                                                               
                                                                                                         
###############################                                                                          
# EXPORT ENVIRONMENT VARIABLE #                                                                          
###############################                                                                          
                                                                                                         
export TERM='xterm-256color'                                                                             
export HOME='/home/tay'                                                                                  
                                                                                                         
# XDG                                                                                                    
export XDG_CONFIG_HOME=$HOME/.config                                                                     
export XDG_DATA_HOME=$HOME/.local/share                                                                  
                                                                                                         
# editor                                                                                                 
export EDITOR="nvim"                                                                                     
export VISUAL="nvim"                                                                                     
                                                                                                         
export HISTSIZE=10000                   # Maximum events for internal history                            
export SAVEHIST=10000                   # Maximum events in history file                                 
                                                                                                         
export VIMCONFIG="$XDG_CONFIG_HOME/nvim"                                                                 
export PATH="$HOME/.local/bin:$PAT
