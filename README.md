# XFCE Superkey Fix

Fix **Super** (**Meta**/**Windows**) key conflict between Whisker/start menu and keyboard shortcuts in XFCE.

>With this fix, when you click the Super key, it will open the Whisker/start menu, but when you hold it down, it will trigger a keyboard shortcuts.

## Installation

Run command below on terminal, as simple as that.
```bash
wget -qO- https://raw.githubusercontent.com/h1toru/xfce-superkey-fix/master/install.sh | bash
```

>For uninstallation, you can choose to uninstall when you run the command.

**Note: reboot is required to apply the configuration.**

## Source
- `xcape` (https://github.com/alols/xcape)
- `ksuperkey` (https://github.com/hanschen/ksuperkey)
- `xfce-superkey` (https://github.com/jixunmoe/xfce-superkey)

All the fix above are tested. In my case, the only one that works is `xfce-superkey`, but you can try three of them to see which one is work for you.

Tested on **Linux Mint 21.1 (Vera) - Xfce Edition**
