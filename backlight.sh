# enable backlight by disablin acpi_backlight
# this solution worked for Dell Inspiron 4010 with
# Intel Core HD Graphics card
#
#
# 1. edit the grub "GRUB_CMDLINE_LINUX_DEFAULT=" line
sudo nano /etc/default/grub
# by adding:
acpi_backlight=none
# (Ctrl-o to save, Crtl-x to exit nano)
#
#
# 2. then update grub
# on Debian/buntu:
sudo update-grub
# on Arch/Manjaro
sudo grub-mkconfig -o /boot/grub/grub.cfg
# on OpenSuse
-su
grub2-mkconfig
# or use Yast Boot Loader (GUI)
