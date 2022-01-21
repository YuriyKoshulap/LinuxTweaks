# enable backlight by disablin acpi_backlight
# this solution worked for Dell Inspiron 4010 with
# Intel Core HD Graphics card
#
# to the grub (sudo nano /etc/default/grub)
# section "GRUB_CMDLINE_LINUX_DEFAULT=" add:
#
acpi_backlight=none
#
# then update grub
# Debian/buntu:
sudo update-grub
# Arch/Manjaro
sudo grub-mkconfig -o /boot/grub/grub.cfg
# OpenSuse
-su
grub2-mkconfig
# or use Yast Boot Loader (GUI)