#
# Variables
#

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--reverse --ansi"

#
# Aliases
#

# alias ghq-src='cd $(ghq list -p | fzf-tmux)'

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
    LBUFFER+=$(git status -s | fzf-tmux | awk -F ' ' '{print $NF}' | tr '\n' ' ')
    CURSOR=$#LBUFFER
    zle reset-prompt
}
zle -N fzf-insert-selected-git-files
bindkey "^g^s" fzf-insert-selected-git-files

fzf-git-ls-files() {
    LBUFFER+=$(git ls-files | fzf-tmux)
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

# fbr - checkout git branch (including remote branches)
git-fbr() {
    local branches branch

    branches=$(git branch --all | grep -v HEAD) &&
        branch=$(echo "$branches" | fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
        git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fco - checkout git branch/tag
git-fco() {
    local tags branches target

    tags=$(
        git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
    branches=$(
        git branch --all | grep -v HEAD             |
            sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
            sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
    target=$(
        (echo "$branches"; echo "$tags") |
            fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
    git checkout $(echo "$target" | awk '{print $2}')
}

# fshow - git commit browser
git-fshow() {
    git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
        fzf --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` \
            --bind "ctrl-m:execute:
                echo '{}' | grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R'"
}

# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
git-fstash() {
    local out q k sha
    while out=$(git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
                       fzf --ansi --no-sort --query="$q" --print-query --expect=ctrl-d,ctrl-b);
    do
        q=$(head -1 <<< "$out")
        k=$(head -2 <<< "$out" | tail -1)
        sha=$(tail -1 <<< "$out" | cut -d' ' -f1)
        [ -z "$sha" ] && continue
        if [ "$k" = 'ctrl-d' ]; then
            git diff $sha
        elif [ "$k" = 'ctrl-b' ]; then
            git stash branch "stash-$sha" $sha
            break;
        else
            git stash show -p $sha
        fi
    done
}
