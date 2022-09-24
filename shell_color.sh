# see the default prompt config

$ echo $PS1

#  by default the command prompt is set to [\u@\h \W]\$

# Before you modify settings save your old prompt using the following command:

oldps1="$PS1"

# So if you messed up, you can switch back easily using the following syntax:

PS1="$oldps1"

# To set a red color prompt, type the following export command:
$ export PS1="\e[0;31m[\u@\h \W]\$ \e[m "

# A list of color codes
# Black	0;30
# Blue	0;34
# Green	0;32
# Cyan	0;36
# Red	0;31
# Purple	0;35
# Brown	0;33
# Blue	0;34
# Green	0;32
# Cyan	0;36
# Red	0;31
# Purple	0;35
# Brown	0;33

# To make the prompt setting permanent edit your $HOME/.bash_profile file or $HOME/.bashrc file

# e.g. append the following line:

export PS1="\e[0;32m[\u@\h \W]\$ \e[m"

# source: https://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/
