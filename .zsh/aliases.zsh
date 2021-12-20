# General
alias ls='colorls'
alias python='python3'
alias pip='pip3'
alias config='cd $HOME/.config'
alias bin='cd $HOME/.local/bin'
alias share='cd $HOME/.local/share'

alias up='sudo apt update -y'                                                                                       
alias aa='sudo apt autoremove -y'                                                                                   
alias ai='sudo apt install -y'                                                                                      
alias ar='sudo apt remove --purge -y'                                                                               
alias as='sudo apt-cache search'                                                                                    
alias rm='rm -rf'                                                                                                   
alias chx='chmod +x'                                                                                                
alias chr='sudo chown -R root:root'                                                                                 
alias cht='sudo chown -R tay:tay'                                                                                   
alias ..='cd ../'                                                                                                   
alias ...='cd ../../'                                                                                               
alias ....='cd ../../../'                                                                                           
alias a2='aria2c -s16 -x32'                                                                                         
alias l='exa -la --color=always --color-scale --icons'                                                              
alias lc='colorls -Ah --gs --sd --dark'                                                                             
alias ip='curl ifconfig.me'                                                                                         
alias ez='exec zsh'                                                                                                 
alias za='nvim $HOME/zsh/aliases.zsh'                                                                                  
alias zf='nvim $HOME/zsh/functions.zsh'                                                                                 
alias zrc='nvim $HOME/.zshrc'                                                                                    
alias vi='nvim'
alias vim='nvim'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'

# Auto-completion
alias up=" nmcli con up id"
alias down=" nmcli con down id"

### APT ###
LSB_DISTRIBUTOR=`lsb_release -i -s`
# debian and ubuntu specific aliases
## autocomplete-able apt-xxx aliases
if [[ "$LSB_DISTRIBUTOR" == "Ubuntu" ]]; then
    alias acs='apt-cache show'
    alias agi='sudo apt-get install'
    alias ag='sudo apt-get'
    alias agu='sudo apt-get update'
    alias agug='sudo apt-get upgrade'
    alias aguu='agu && agug'
    alias agr='sudo apt-get uninstall'
    alias agp='sudo apt-get purge'
    alias aga='sudo apt-get autoremove'
    alias ctl='sudo service '
    alias feierabend='sudo shutdown -h now'
fi

# arch linux with systemd aliases
if [[ "$LSB_DISTRIBUTOR" == "archlinux" ]]; then
    # statements
    alias ctl='sudo systemctl '
    alias feierabend='sudo systemctl start poweroff.target'
    alias start=" sudo systemctl start"
    alias stop=" sudo systemctl stop"
    alias status=" sudo systemctl status"
    alias restart=" sudo systemctl restart"
    alias reboot="sudo systemctl start reboot.target"
fi