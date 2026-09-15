# Install Windows fonts on Linux

Assuming fonts from C:\Windows\Fonts were copied to Linux ~/Downloads/windows-fonts, run:

sudo mkdir -p /usr/local/share/fonts/windows
sudo cp ~/Downloads/windows-fonts/*.{ttf,TTF,otf,OTF} /usr/local/share/fonts/windows/ 2>/dev/null
sudo chmod 644 /usr/local/share/fonts/windows/*
sudo fc-cache -f -v

Then you can check that Linux sees them, for example:
fc-list | grep -i "Arial"
fc-list | grep -i "Calibri"
fc-list | grep -i "Times New Roman"

~~~~
If your font folder contains subfolders, use this instead:
sudo cp -r /path/to/your/windows-fonts/* /usr/local/share/fonts/windows/
sudo find /usr/local/share/fonts/windows -type f -exec chmod 644 {} \;
sudo find /usr/local/share/fonts/windows -type d -exec chmod 755 {} \;
sudo fc-cache -f -v
