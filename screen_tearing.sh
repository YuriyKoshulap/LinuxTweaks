#!/bin/bash
# This is an example of a File Header comments in Bash
#
# Copyright 2022 Yuriy Koshulap
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


#######################################
#
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
########################################

Section "Device"
  Identifier  "Intel Graphics"
  Driver      "Intel"
  Option      "TearFree"    "true"
EndSection