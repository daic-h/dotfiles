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
