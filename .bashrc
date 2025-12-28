PS1="\[\e[0;32m\]\u@\h:\w\$ \[\e[m\]"

# Always use color and put directories first
alias ls='ls --color=auto --group-directories-first'

# LS_COLORS: bright yellow directories, regular files blue, everything else default
export LS_COLORS="di=1;33:fi=36:ln=0:pi=0:so=0:bd=0:cd=0:ex=0"

#########################
### Make nano editor by defaul
export EDITOR=nano
export VISUAL=nano
export SUDO_EDITOR=nano

### !!!! apply !!! by running
# source ~/.bashrc

### Alternative color config
## green alias in bash
## tested on xfce4-terminal 1.0.0
## create edit or create ~/.bashrc with the following code:

# export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] $PWD \[\033[00m\]$ '

## if something is not working, check permissions
## they should be -rw-r--r--
## to change them:
## chmod 644 .bashrc

########################

### To change editor for security tools (like visudo) to nano run these two in terminal
# echo 'export EDITOR=nano' >> ~/.bashrc
# source ~/.bashrc

########################

### For Debian and its derivatives: Custom apt shortcuts
## alias changing apt's "isntall" to "in", "search" to "se", "remove" to "rm", "autoremove" to "arm", "update && upgrade" to "up" and "full-upgrade" to "dup"
# apt() {
#    case "$1" in
#        in)   shift;   sudo apt install "$@";;
#        se)   shift;   apt search "$@";;
#        rm)   shift;   sudo apt remove "$@";;
#        arm)  shift;   sudo apt autoremove "$@";;
#        up)   shift;   sudo apt update && sudo apt upgrade "$@";;
#        dup)  shift;   sudo apt full-upgrade "$@";;
#        *)    sudo apt "$@";;
#    esac
# }
