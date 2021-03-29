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
        echo "linking $dotpath"
      done
      ;;
    .local)
      echo "[copying $dotpath -> .local]"
      echo "cp -rf $dotpath $HOME"
      cp -rf $dotpath $HOME
      ;;
    root)
      echo "[copying $dotpath -> /]"
      echo "sudo cp -rf $dotpath /"
      sudo cp -rf $dotpath /
      ;;
    .git | run.sh)
      echo "ignoring $dots"
    esac
done
