# fish aliases
alias update "sudo pacman -Syyu"
alias jctl "journalctl -p 3 -xb"
alias chrome "google-chrome-stable --force-dark-mode"
alias sr "sudo reboot"
alias tobash "sudo chsh $USER -s (which bash) && echo 'Now log out.'"
alias tozsh "sudo chsh $USER -s (which zsh) && echo 'Now log out.'"
alias tofish "sudo chsh $USER -s (which fish) && echo 'Now log out.'"
alias cleanup "sudo pacman -Qtdq | sudo pacman -Rns -"
alias ll "exa -ll"
alias la "exa -la"

# fish abbreviations
abbr install-fonts "sudo fc-cache -fv"
abbr pacman "sudo pacman"
abbr mirror "sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
abbr wl-electron "--enable-features=UseOzonePlatform --ozone-platform=wayland"

# shell variables
set fish_greeting
#set -x EDITOR nvim
#set -x VISUAL nvim
#set PATH $HOME/.cargo/bin/ $HOME/.local/bin $PATH

# startup
starship init fish | source
