#!/usr/bin/env zsh

SAVEIFS=$IFS
IFS="$(printf '\n\t')"      

function apt-import-key () {
    gpg --keyserver subkeys.pgp.net --recv-keys $1 | gpg --armor --export $1 | sudo apt-key add -
}

# reloads all functions
r() {
    local f
    f=(~/.config/zsh/functions.d/*(.))
    unfunction $f:t 2> /dev/null
    autoload -U $f:t
}

# creates new script, populating shebang line & executable.
shebang() {
    if i=$(which $1);
    then
        printf '#!/usr/bin/env %s\n\n' $1 > $2 && chmod 755 $2 && vim + $2 && chmod 755 $2;
    else
        echo "'which' could not find $1, is it in your \$PATH?";
    fi;
    # in case the new script is in path, this throw out the command hash table and
    # start over  (man zshbuiltins)
    rehash
}

### Run With Sudo ###
run-with-sudo() { LBUFFER="sudo $LBUFFER" }
zle -N run-with-sudo
bindkey '^Xs' run-with-sudo

### EXTRACT ###
function extract {                                          
  if [ -z "$1" ]; then                                         
    # display usage if no parameters given                                                                          
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"           
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"                      
 else                                                                                                               
    for n in "$@"                                                                                                   
    do                                                                                                              
      if [ -f "$n" ] ; then                                                                                         
          case "${n%,}" in                                                                                          
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)                                             
                         tar xvf "$n"       ;;                                                                      
            *.lzma)      unlzma ./"$n"      ;;                                                                      
            *.bz2)       bunzip2 ./"$n"     ;;                                                                      
            *.cbr|*.rar) unrar x -ad ./"$n" ;;                                                                      
            *.gz)        gunzip ./"$n"      ;;                                                                      
            *.cbz|*.epub|*.zip) unzip ./"$n"       ;;                                                               
            *.z)         uncompress ./"$n"  ;;                                                                      
            *.7z|*.apk|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)         
                         7z x ./"$n"        ;;                                                                      
            *.xz)        unxz ./"$n"        ;;                                                                      
            *.exe)       cabextract ./"$n"  ;;                                                                      
            *.cpio)      cpio -id < ./"$n"  ;;                                                                      
            *.cba|*.ace) unace x ./"$n"      ;;                                                                     
            *.zpaq)      zpaq x ./"$n"      ;;                                                                      
            *.arc)       arc e ./"$n"       ;;                                                                      
            *.cso)       ciso 0 ./"$n" ./"$n.iso" && \                                                              
                              extract $n.iso && \rm -f $n ;;                                                        
            *)                                                                                                      
                         echo "extract: '$n' - unknown archive method"                                              
                         return 1                                                                                   
                         ;;                                                                                         
          esac                                                                                                      
      else                                                                                                          
          echo "'$n' - file does not exist"                                                                         
          return 1                                                                                                  
      fi                                                                                                            
    done                                                                                                            
fi                                                                                                                  
}                                                                                                                   
 
### Source ZSH ###                                                                                                                   
sourceZsh(){
    source ~/.zshrc
    backupToDrive ~/.zshrc
    echo "New .zshrc sourced."
}

### Edit ZSH ###
editZsh(){
    nano ~/.zshrc
    source ~/.zshrc
    backupToDrive ~/.zshrc
    echo "New .zshrc sourced."
}

### Backup ###
backupToDrive(){
    cp "$1" /Users/<username>/Google\ Drive/Config/.zshrc
    echo "New .zshrc backed up to Google Drive."
}
