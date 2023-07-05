#!/bin/bash -e

echo -e "[1] https://github.com/alols/xcape
[2] https://github.com/hanschen/ksuperkey
[3] https://github.com/jixunmoe/xfce-superkey (Recommended)"
read -p "Which fixer do you want to use? " fix
case $fix in
    1) url='https://github.com/alols/xcape' ;;
    2) url='https://github.com/hanschen/ksuperkey' ;;
    3) url='https://github.com/jixunmoe/xfce-superkey' ;;
    *) echo "Please input one of the option above!"; exit 1 ;;
esac

# env variable
ID=${url##*/}
asconf=~/.config/autostart/${ID}.desktop
ksconf=~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml

# install dependencies
echo "Installing dependencies.. "
[ -n "$(command -v apt)" ] && \
sudo apt install git gcc make libx11-dev libxtst-dev pkg-config -y &>/dev/null
[ -n "$(command -v dnf)" ] && \
sudo dnf install git gcc make libX11-devel libXtst-devel pkgconfig &>/dev/null

# fetch and compile the fixer
cd ~/Downloads
rm -rf ~/Downloads/$ID 2>/dev/null
git clone $url &>/dev/null
echo "$url Fetched."
cd $ID
make &>/dev/null

read -p "Install or Uninstall? [I/U] " iu
if [ "${iu,,}" == "u" ]; then
    sudo make uninstall || \
    sudo rm -f $(find /usr/bin /usr/local/bin -type 'f' -name "$ID" 2>/dev/null)
    rm -f $asconf 2>/dev/null
    [ -f ${ksconf}.bak ] && mv ${ksconf}.bak $ksconf
    echo "Uninstalled!"
else
    sudo make install
    # generate autostart
    rm -f $askonf 2>/dev/null
    echo "[Desktop Entry]
Type=Application
Name=$ID
Comment=Super key fixer
Exec=$(find /usr/bin /usr/local/bin -type 'f' -name "$ID" 2>/dev/null)
StartupNotify=false
Terminal=false
Hidden=false
" > $asconf
    # remove whisker menu from keyboard shortcut and '(keypad)' from window manager's shortcut
    [ -f ${ksconf}.bak ] || cp $ksconf ${ksconf}.bak
    cat $ksconf | grep -v 'whiskermenu' | sed 's|KP_||g' | tee $ksconf >/dev/null
    echo "Installed!"
fi

# cleanup
rm -rf ~/Downloads/$ID 2>/dev/null

# apply changes
echo "Reboot is required to apply changes."
read -p "Do you want to reboot now? [Y/n] " yn
[ "${yn,,}" == "y" ] && reboot
