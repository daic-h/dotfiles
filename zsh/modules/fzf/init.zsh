#
# Variables
#

path=(${0:h}/bin $path)
export FZF_DEFAULT_OPTS="--reverse --ansi"
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#
# Aliases
#

# alias ghq-src='cd $(ghq list -p | fzf-tmux)'
alias gh='gh-open $(ghq list -p | fzf)'

#
# Functions
#

ghq-src() {
    local selected

    selected="$(ghq list --full-path | fzf-tmux --query="$LBUFFER")"
    if [ -n "$selected" ]; then
        BUFFER="builtin cd $selected"
        zle accept-line
    fi
    zle reset-prompt
}
zle -N ghq-src
bindkey '^]' ghq-src

fzf-insert-selected-git-files() {
    LBUFFER+=$(git status -s | fzf | awk -F ' ' '{print $NF}' | tr '\n' ' ')
    CURSOR=$#LBUFFER
    zle reset-prompt
}
zle -N fzf-insert-selected-git-files
bindkey "^g^s" fzf-insert-selected-git-files

fzf-git-ls-files() {
    LBUFFER+=$(git ls-files | fzf)
    CURSOR=$#LBUFFER
    zle reset-prompt
}
zle -N fzf-git-ls-files
bindkey "^x^b" fzf-git-ls-files

fzf-cdr() {
    local destination=$(cdr -l | sed -e 's/^[[:digit:]]*[[:blank:]]*//' | fzf-tmux --query "$LBUFFER")

    if [ -n "$destination" ]; then
        BUFFER="cd $destination"
        zle accept-line
    else
        zle reset-prompt
    fi
}
zle -N fzf-cdr
bindkey '^xb' fzf-cdr

fzfe () {
    file=$(hw $@ | fzf)
    if [ -n "$file" ]; then
        `echo $file | awk -F : '{print "e +" $2 " " $1}'`
    fi
}
