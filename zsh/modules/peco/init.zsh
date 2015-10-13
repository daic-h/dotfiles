#
# Aliases
#

alias ghq-peco='cd $(ghq list -p | peco)'
alias ghq-gh-open='gh-open $(ghq list -p | peco)'

#
# Functions
#

function peco-cdr() {
    local destination=$(cdr -l | sed -e 's/^[[:digit:]]*[[:blank:]]*//' | peco --query "$LBUFFER")
    if [ -n "$destination" ]; then
        BUFFER="cd $destination"
        zle accept-line
    else
        zle reset-prompt
    fi
}
zle -N peco-cdr
bindkey '^xb' peco-cdr

function peco-insert-selected-git-files() {
    LBUFFER+=$(git status -s | peco | awk -F ' ' '{print $NF}' | tr '\n' ' ')
    CURSOR=$#LBUFFER
    zle reset-prompt
}
zle -N peco-insert-selected-git-files
bindkey "^g^s" peco-insert-selected-git-files
