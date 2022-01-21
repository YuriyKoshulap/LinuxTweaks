# On some Linux desktops environments with non OpenGL (e.g. xRandR)
# this code prevents screen tearing
# on my old Dell Inspiron 14R (N4010) with Intel Core HD Graphics (915)
# To check if you have this problem https://www.youtube.com/watch?v=MfL_JkcEFbE 
#
# The code goes into the following file: /usr/share/X11/xorg.conf.d/20-intel.conf
# To create/edit this file, you need SU permission (sudo)
#
# Hence, normally I create it with "sudo nano /usr/share/X11/xorg.conf.d/20-intel.conf"
# and copy/paste the code below

Section "Device"
  Identifier  "Intel Graphics"
  Driver      "Intel"
  Option      "TearFree"    "true"
EndSection