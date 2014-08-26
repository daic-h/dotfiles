alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias emacsclient='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
alias et='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
alias e:start='open /Applications/Emacs.app'
alias e:byte_compile='emacs -Q -batch -f batch-byte-compile'

function e() {
    if [[ "$1" != "" ]]; then
        tempuid=$(id -u)
        esrv="${TMPDIR}emacs${tempuid}/server"

        if [ ! -e $esrv ]
        then
            open /Applications/Emacs.app
            while [ ! -e $esrv ]; do sleep 1; done
        fi
        emacsclient -n "$@"
    else
        open /Applications/Emacs.app
    fi
}
