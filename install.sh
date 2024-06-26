#!/bin/bash

user_name="$USER"

# Cleaning previous directories
echo "Cleaning directories..."
#rm WhiteSur* -rf &&

## Cloning required files
# GTK theme
git clone https://github.com/vinceliuice/Orchis-theme.git --depth=1
# Icons
git clone https://github.com/vinceliuice/Tela-icon-theme.git --depth=1
# Cursors
git clone https://github.com/vinceliuice/Vimix-cursors.git --depth=1

## Installing theme ##
# GTK theme
if [[ -f "$1" || "$1" = '-light' ]]; then
  Orchis-theme/install.sh -l -c Light
else
  Orchis-theme/install.sh -l -c Dark
fi
Orchis-theme/tweaks.sh -F

# Icons
Tela-icon-theme/install.sh -b

# Cursors
mkdir -p ~/.local/share/icons/WhiteSur-cursors
cp Vimix-cursors/dist/* ~/.local/share/icons/WhiteSur-cursors -prf

# Wallpapers
mkdir -p ~/Pictures/
cp -r wallpaper/* ~/Pictures/ 
#gsettings set org.gnome.desktop.background picture-uri "file:///home/$user_name/Pictures/monterey.png"
#gsettings set org.gnome.desktop.background picture-uri-dark "file:///home/$user_name/Pictures/monterey.png"

# Load settings using dconf
dconf load / < settings.dconf

# Fonts
#cp fonts/* ~/.local/share/fonts/ 
