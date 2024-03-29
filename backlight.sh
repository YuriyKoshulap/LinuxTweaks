# tested on Dell Inspiron 14R N4010 with Intel Core HD Graphics with "intel_backlight"
# depending of distro, different stages of this solution sloved the problem
# therefore, follow the steps from top to bottom, until the problem solved

# if
ls /sys/class/backlight/
# returns something else than "acpi_video0", enable the backlight by disablin acpi_backlight in grub:

# in many distros these 2-3 steps were enough:
# 1. add acpi_backlight=none to GRUB_CMDLINE_LINUX_DEFAULT="" in /etc/default/grub
sudo nano /etc/default/grub
# add acpi_backlight=none, save (Ctrl+o) and exit (Ctrl+x)
#
# 2. Update grub:
# on Debian/buntu
sudo update-grub
#
# updating grub on other distros:
# on Arch/Manjaro: 
sudo grub-mkconfig -o /boot/grub/grub.cfg
# on OpenSuse:
sudo grub2-mkconfig
# or use Yast Boot Loader (GUI)
# 
# 3. (for LXQt only) change Shortcut Keys command from lxqt-config-brightness -d [or -i] to:
lxqt-backlight_backend --inc [or --dec]


# if it didn't help, see the result of this command:
ls -al /sys/class/backlight/intel_backlight/brightness
# if (among others) it returns "root root" (the owner user and owner group), it is necessarry to create a udev rule for this file:
sudo nano /etc/udev/rules.d/backlight.rules
# add the following lines:
RUN+="/bin/chgrp [your user name] /sys/class/backlight/intel_backlight/brightness"
RUN+="/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness"

# reference: https://wiki.archlinux.org/title/backlight
