# If Wifi suddenly drops disabling 802.11n standard improves
# this solution solved issue on "Intel Corporation Centrino Wireless-N 1000"

# Solution: add the line below to /etc/modprobe.d/iwlwifi.conf
options iwlwifi 11n_disable=1 led_mode=1 swcrypto=1
