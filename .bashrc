# green alias in bash
# tested on xfce4-terminal 1.0.0
# create edit or create ~/.bashrc with the following code:

export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] $PWD \[\033[00m\]$ '

# if something is not working, check permissions
# they should be -rw-r--r--
# to change them:
# chmod 644 .bashrc
