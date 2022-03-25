# can't log in as the screen seems to crash for 0.5s, after this the login screen reappears - loop
# 1. log in to tty (At the login screen, press Ctrl + Alt + F5)
# 2. to check, run:
ausearch -m AVC
# 3. if it returns among others: "unlabeled_t", run the following command as root:
/sbin/restorecon -v /home/[username]
#
#
#
# other sources suggested to check with:
ls -lZ /home
# which (when all is fine) should otput "unconfined_u:object_r:user_home_dir_t", otherwise, run
sudo restorecon -R /home
