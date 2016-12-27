zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list # _history
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 小文字で保管した場合のみ大文字小文字を分けない
zstyle ':completion:*' use-cache true
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:cd:*' ignore-parents parent pwd # ../ の時にカレントディレクトリを表示しない
zstyle ':completion:*:default' menu select=2                      # 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#' # 補完候補にファイルとして扱わない
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT
