#
# Options
#

bindkey -e # emacs keybind
setopt nobeep # ビープを鳴らさない

#
# Variables
#

WORDCHARS=${WORDCHARS:s,/,,} ## 「/」も単語区切りとみなす。
WORDCHARS="${WORDCHARS}|" ## 「|」も単語区切りとみなす。

#
# External Editor
#

# Allow command line editing in an external editor.
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
