export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
#nnn
export NNN_PLUG="p:preview-tui"
export NNN_FIFO="/tmp/nnn.fifo"
#go
#export PATH=$PATH:/usr/lib/go/bin
#export GOPATH=$HOME/go
#export PATH=$PATH:$HOME/go/bin
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
#zsh
export ZDOTDIR=$HOME/.config/zsh
. "$HOME/.cargo/env"
