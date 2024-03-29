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
