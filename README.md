# Arch Dotfiles

Dotfiles collection

## Dependencies

Enable multilib, use `yay`

### Sway, River - Wayland

```
yay -S sway mako autotiling swappy-git swayidle-git swaylock-effects-git waybar-git wf-recorder wlogout-git wob-git wl-clipboard slurp grim
```

### DWM - X11

```
yay -S dunst picom-jonaburg-git rofi xorg feh
# own DWM build
```

### Both

```
# X
yay -S xorg-server xorg
# Wayland
yay -S wayland wayland-protocols xorg-xwayland
# Video Drivers
yay -S xf86-video-amdgpu
# Video Acceleration
yay -S libva-mesa-driver
## Info:
# https://wiki.archlinux.org/index.php/xorg#Driver_installation
# https://wiki.archlinux.org/index.php/Hardware_video_acceleration

# Display manager:
yay -S gtk3 gtk3 greetd-git greetd-gtkgreet-git sway
# GDM (Wayland compatible)
# Lightdm (Not Wayland compatible)

# Audio
yay -S alsa-utils pulseaudio-alsa pamixer pulsemixer pavucontrol
# Bluetooth
yay -S bluez bluez-utils pulseaudio-bluetooth
## Info:
# https://wiki.archlinux.org/index.php/PulseAudio

# Fonts
yay -S noto-fonts adobe-source-han-sans-cn-fonts adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts ttf-material-design-icons-extended ttf-joypixels ttf-roboto-mono fontconfig freetype2 lib32-fontconfig lib32-freetype2 libfontenc libotf

#GTK/QT
yay -S materia-gtk-theme qt5-base materia-kde kvantum-theme-materia


# Juicers
yay -S kitty ffmpeg mpv imv azote-git neovim-nightly-bin nwg-launchers lxappearance pavucontrol polkit polkit-gnome bottom htop rg bat exa procs fd starship zathura zathura-pdf-poppler jq libxft-bgra wofi evince papirus-icon-theme pango youtube-dl reflector brave unimatrix-git tesseract tesseract-data-eng google-chrome firefox fish-git


# EWW: https://elkowar.github.io/eww/main/
# River: https://github.com/ifreund/river/
```

## Notes

https://wiki.archlinux.org/index.php/Polkit
https://github.com/jamesofarrell/i3-swallow/
