# Problem: bash replies "[user] is not in the sudoer group" on OpenSuse Tumbleweed

sudo may not be installed by default. Run:
su root
[enter password when prompted]

next, to enable sudo access for a user account, do the following:
sudo /usr/sbin/visudo

source: https://en.opensuse.org/SDB:Administer_with_sudo
