#History
HISTSIZE=2000
SAVEHIST=2000
HISTFILE=~/.cache/zsh/history

#auto/tab complete:
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

# declare a list of expandable aliases to fill up later
typeset -a ealiases
ealiases=()

# write a function for adding an alias to the list mentioned above
function abbr() {
    alias $1
    ealiases+=(${1%%\=*})
}

# expand any aliases in the current line buffer
function expand-ealias() {
    if [[ $LBUFFER =~ "\<(${(j:|:)ealiases})\$" ]]; then
        zle _expand_alias
        zle expand-word
    fi
    zle magic-space
}
zle -N expand-ealias

# Bind the space key to the expand-alias function above, so that space will expand any expandable aliases
bindkey ' '            expand-ealias
bindkey '^ '           magic-space     # control-space to bypass completion
bindkey -M isearch " " magic-space     # normal space during searches

# A function for expanding any aliases before accepting the line as is and executing the entered command
expand-alias-and-accept-line() {
    expand-ealias
    zle .backward-delete-char
    zle .accept-line
}
zle -N accept-line expand-alias-and-accept-line

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

#alias and ?abbriations?
[ -f "$HOME/.config/zsh/aliases.sh" ] && source "$HOME/.config/zsh/aliases.sh"

#env

# Plugins
# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ZSH history substring search
#source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# ZSH auto suggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#bindkey -M vicmd 'k' history-substring-search-up
#bindkey -M vicmd 'j' history-substring-search-down

#prompt
eval $(starship init zsh)
