alias emacs.tmpdir='${TMPDIR}emacs$(id -u)'
alias emacs.rmsock='rm ${TMPDIR}emacs$(id -u)/server'

e () {
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
