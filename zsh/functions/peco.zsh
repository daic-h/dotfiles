if which peco > /dev/null; then
    # zsh_historyの検索
    # function peco-select-history() {
    #     local tac
    #     if which tac > /dev/null; then
    #         tac="tac"
    #     else
    #         tac="tail -r"
    #     fi
    #     BUFFER=$(history -n 1 | \
    #              eval $tac | \
    #              peco --query "$LBUFFER")
    #     CURSOR=$#BUFFER
    # }
    # zle -N peco-select-history
    # bindkey '^r' peco-select-history

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
fi
