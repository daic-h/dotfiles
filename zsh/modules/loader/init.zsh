function pmodload {
    local ZSH=$HOME/.dotfiles/zsh
    local -a pmodules
    local pmodule
    local pfunction_glob='^([_.]*|prompt_*_setup|README*)(-.N:t)'

    # $argv is overridden in the anonymous function.
    pmodules=("$argv[@]")

    # Add functions to $fpath.
    fpath=(${pmodules:+${ZSH}/modules/${^pmodules}/functions(/FN)} $fpath)

    function {
        local pfunction

        # Extended globbing is needed for listing autoloadable function directories.
        setopt LOCAL_OPTIONS EXTENDED_GLOB

        # Load Prezto functions.
        for pfunction in ${ZSH}/modules/${^pmodules}/functions/$~pfunction_glob; do
            autoload -Uz "$pfunction"
        done
    }

    # Load Prezto modules.
    for pmodule in "$pmodules[@]"; do
        if zstyle -t ":prezto:module:$pmodule" loaded 'yes' 'no'; then
            continue
        elif [[ ! -d "${ZSH}/modules/$pmodule" ]]; then
            print "$0: no such module: $pmodule" >&2
            continue
        else
            if [[ -s "${ZSH}/modules/$pmodule/init.zsh" ]]; then
                source "${ZSH}/modules/$pmodule/init.zsh"
            fi

            if (( $? == 0 )); then
                zstyle ":prezto:module:$pmodule" loaded 'yes'
            else
                # Remove the $fpath entry.
                fpath[(r)${ZSH}/modules/${pmodule}/functions]=()

                function {
                    local pfunction

                    # Extended globbing is needed for listing autoloadable function
                    # directories.
                    setopt LOCAL_OPTIONS EXTENDED_GLOB

                    # Unload Prezto functions.
                    for pfunction in ${ZSH}/modules/$pmodule/functions/$~pfunction_glob; do
                        unfunction "$pfunction"
                    done
                }

                zstyle ":prezto:module:$pmodule" loaded 'no'
            fi
        fi
    done
}
