#!/bin/sh

##!/bin/dash

dir_dotfiles=$(cd $(dirname $0); pwd -P)
echo "DOTFILES: $dir_dotfiles"

for dots in $(ls -A $dir_dotfiles); do
  dotpath=$dir_dotfiles/$dots
  case $dots in
    .config)
      echo "[symlinking $dots folders -> .config]"
      for config in $(ls -A $dotpath); do
        ln -s $dotpath $HOME/$dots
      done
      ;;
    .local | .xinitrc)
      echo "[copying $dotpath -> ~/$dots]"
      cp -rf $dotpath $HOME
      ;;
    root)
      echo "[copying $dotpath -> /]"
      sudo cp -rf $dotpath /
      ;;
    esac
done
