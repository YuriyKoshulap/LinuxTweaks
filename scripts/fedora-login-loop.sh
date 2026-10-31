# Problem: upon installing Fedora, the login screen gets into a loop after entering the valid password
# 1. log in to tty (At the login screen, press Ctrl + Alt + F5)
# 2. to check, run:
[sudo] ausearch -m AVC
# 3. if it returns among others: "unlabeled_t", run the following command as root:
[sudo] /sbin/restorecon -v /home/[username]
#
#
#
# other sources suggested to check with:
ls -lZ /home
# which (when all is fine) should otput "unconfined_u:object_r:user_home_dir_t", otherwise, run
sudo restorecon -R /home
