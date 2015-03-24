if which peco > /dev/null; then
    # chpwd_recent_dirsの検索
    function peco-cdr() {
        local destination=$(cdr -l | \
                                   sed -e 's/^[[:digit:]]*[[:blank:]]*//' | \
                                   peco --query "$LBUFFER")
        if [ -n "$destination" ]; then
            BUFFER="cd $destination"
            zle accept-line
        else
            zle reset-prompt
        fi
    }
    zle -N peco-cdr
    bindkey '^xb' peco-cdr

    function peco_select_from_git_status(){
        git status -s | \
            peco | \
            awk -F ' ' '{print $NF}' | \
            tr '\n' ' '
    }

    function peco_insert_selected_git_files(){
        LBUFFER+=$(peco_select_from_git_status)
        CURSOR=$#LBUFFER
        zle reset-prompt
    }

    zle -N peco_insert_selected_git_files
    bindkey "^g^s" peco_insert_selected_git_files

    alias ghq-peco='cd $(ghq list -p | peco)'
    alias ghq-gh-open='gh-open $(ghq list -p | peco)'
fi
