# XFCE Superkey Fix

>Fix **Super** key (also known as **Meta** or **Windows** button) conflict between Whisker menu and keyboard shortcuts in XFCE.

>With this fix, when you click the Super key, it will open the Whisker menu, but when you hold it down, it will trigger a keyboard shortcuts.

## Installation

Run command below on terminal, as simple as that.
```bash
curl -fsSL https://raw.githubusercontent.com/h1toru/bash/master/xfce-superkey-fix/cleanup_apt.sh | bash
```

>For uninstallation, you can choose to uninstall when you run the command.

\* **reboot is required to apply the configuration.**

## Source
- `xcape` (https://github.com/alols/xcape)
- `ksuperkey` (https://github.com/hanschen/ksuperkey)
- `xfce-superkey` (https://github.com/jixunmoe/xfce-superkey)

All the fix above are tested. In my case, the only one that works is `xfce-superkey`, but you can try three of them to see which one is work for you.

Tested on **Linux Mint 21.1 (Vera) - Xfce Edition**
