################## Zypper area###################
sudo zypper rm -u foo
zypper packages --unneeded --- (apt autoremove alternative)
#################################################

# List peripherials
lsblk  # List information about block devices, e.g. USB.
lspci  # List info about PCI buses and devices
dmesg  # Display or control the kernel ring buffer.

# Run the last command as root
sudo !!

# Restore a broken terminal
reset

# become root w.o. being a root group member
su root

# My IP address
curl ifconfig.me

# See the ASCII table
man ascii

# Network activity in realtime
lsof -i

# remind to leave in 15 min
leave +15

# send an http HEAD request w/curl
curl -I http://localhost

############
# pitfalls #
############
# Whitespace matters when assigning variables
foo = 'bar' #incorrect
foo= 'bar' #incorrect
foo='bar' #correct

#############
# misc tips #
#############
### Display asterisks **** when entering sudo password
# run

sudo visudo

# find line starting Defaults env_reset
# add ", pwfeedback", so that it looks:
# Defaults env_reset, pwfeedback

# if sudo gets opened in vim,
# change it to nano by running

echo 'export SUDO_EDITOR=nano' >> ~/.bashrc

## in addition run these two lines to make nano an editor by default for all cases
# echo 'export EDITOR=nano' >> ~/.bashrc
# echo 'export VISUAL=nano' >> ~/.bashrc

# apply it
source ~/.bashrc

##############
# Shell Color#
##############
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
