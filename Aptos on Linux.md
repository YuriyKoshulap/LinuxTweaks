# Install Aptos font on Linux

download the Aptos ZIP from Windows to
~/Downloads/Microsoft Aptos Fonts.zip
then run:

mkdir -p /tmp/aptos-fonts
unzip ~/"Downloads/Microsoft Aptos Fonts.zip" -d /tmp/aptos-fonts
sudo mkdir -p /usr/local/share/fonts/aptos
sudo find /tmp/aptos-fonts -type f \( -iname '*.ttf' -o -iname '*.otf' \) -exec cp {} /usr/local/share/fonts/aptos/ \;
sudo chmod 644 /usr/local/share/fonts/aptos/*
sudo fc-cache -f

Then you can verify:
fc-list | grep -i aptos
