# If Wifi suddenly drops disabling 802.11n standard improves
# this solution solved issue on "Intel Corporation Centrino Wireless-N 1000"

# Solution:
sudo nano /etc/modprobe.d/iwlwifi.conf
# add the following line:
options iwlwifi 11n_disable=1 led_mode=1 swcrypto=1
# Save (Ctrl+o) and exit (Ctrl+x)
