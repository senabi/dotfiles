#!/bin/sh

install="yay -S "

# For Sway / River
$install sway mako autotiling 
$install swappy-git swayidle-git swaylock-effects-git waybar-git wf-recorder
$install wlogout-git wob-git wl-clipboard slurp grim 
# For X
$install dunst picom-jonaburg-git rofi xorg feh
# X
$install xorg-server xorg betterlockscreen
# own dwm build
# Wayland
$install wayland wayland-protocols xorg-xwayland
# Video Drivers
$install xf86-video-amdgpu
# Video Acceleration
$install libva-mesa-driver
# Display manager:
$install gtk3 greetd-git greetd-gtkgreet-git sway
# GDM (Wayland compatible)
# Lightdm (Not Wayland compatible)

# Audio
$install alsa-utils pulseaudio-alsa pamixer pulsemixer pavucontrol
# Bluetooth
# $install bluez bluez-utils pulseaudio-bluetooth

# Fonts
$install noto-fonts adobe-source-han-sans-cn-fonts adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts ttf-material-design-icons-extended ttf-joypixels ttf-roboto-mono fontconfig freetype2 lib32-fontconfig lib32-freetype2 libfontenc libotf

#GTK/QT
$install materia-gtk-theme qt5-base kvantum-qt5 materia-kde kvantum-theme-materia qt5-wayland

# Juicers
$install kitty ffmpeg mpv imv azote-git neovim-nightly-bin nwg-launchers lxappearance pavucontrol polkit polkit-gnome bottom htop ripgrep bat exa procs fd starship zathura zathura-pdf-poppler jq libxft-bgra wofi evince papirus-icon-theme pango youtube-dl reflector brave unimatrix-git tesseract tesseract-data-eng google-chrome firefox fish-git
