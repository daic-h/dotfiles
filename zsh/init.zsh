# Source module loader.
source "${0:h}/modules/loader/init.zsh"

# Source the Prezto configuration file.
if [[ -s "${ZDOTDIR:-$HOME}/.zcustom" ]]; then
    source "${ZDOTDIR:-$HOME}/.zcustom"
fi

# Load Zsh modules.
zstyle -a ':prezto:load' zmodule 'zmodules'
for zmodule ("$zmodules[@]") zmodload "zsh/${(z)zmodule}"
unset zmodule{s,}

# Autoload Zsh functions.
zstyle -a ':prezto:load' zfunction 'zfunctions'
for zfunction ("$zfunctions[@]") autoload -Uz "$zfunction"
unset zfunction{s,}

# Load modules.
zstyle -a ':prezto:load' pmodule 'pmodules'
pmodload "$pmodules[@]"
unset pmodules

# Load specific config
if [[ -s "${ZDOTDIR:-$HOME}/.localrc" ]]; then
    source ~/.localrc
fi
