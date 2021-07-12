## Appearance
- Arc theme
- Papirus icon theme

## Fonts
- Noto Sans Regular 10
- Hack 9

## Lock Screen
Disable lock screen

## Shortcuts
/usr/bin/gnome-terminal
/usr/bin/nautilus
/usr/bin/google-chrome-stable
/usr/bin/chromium
/usr/bin/firefox

Hide windows
Caps lock as Alt

dconf dump /org/gnome/desktop/wm/keybindings/ > gnome/wm-keybindings.dconf.bak
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > gnome/media-keys-keybindings.dconf.bak

dconf load /org/gnome/desktop/wm/keybindings/ < gnome/wm-keybindings.dconf.bak
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < gnome/media-keys-keybindings.dconf.bak

## Remap Caps-Lock
Tweaks -> Keyboard and Mouse (Search for Typing) -> Additional Layout Options



