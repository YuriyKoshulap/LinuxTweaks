#What is zypper equivalent of 'apt autoremove'?

https://www.reddit.com/r/openSUSE/comments/i57ld8/what_is_zypper_equivalent_of_apt_autoremove/

# dependencies/requires: awk, grep and xargs

#~~~~~~~~~~~~~~~~~~~~~~

#a more simple solution:

clean() { zypper packages --unneeded | awk -F'|' 'NR==0 || NR==1 || NR==2 || NR==3 || NR==4 {next} {print $3}' | grep -v Name | sudo xargs -r zypper remove --clean-deps; }

#source: https://www.reddit.com/r/openSUSE/comments/i57ld8/what_is_zypper_equivalent_of_apt_autoremove/
