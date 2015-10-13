# Add zsh-completions to $fpath.
fpath=("${0:h}/external/src" $fpath)

# Load and initialize the completion system ignoring insecure directories.
autoload -Uz compinit && compinit -i

#
# Options
#

setopt ALWAYS_LAST_PROMPT   # カーソル位置は保持したままファイル名一覧を順次その場で表示
# setopt ALWAYS_TO_END        # Move cursor to the end of a completed word.
setopt AUTO_LIST            # 補完候補を一覧表示
setopt AUTO_MENU            # 補完キー連打で順に補完候補を自動で補完
setopt AUTO_PARAM_KEYS      # カッコの対応などを自動的に補完
setopt AUTO_PARAM_SLASH     # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt AUTO_RESUME          # サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt BRACE_CCL            # {A-C} を A B C に展開する機能を使えるようにする
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD     # 語の途中でもカーソル位置で補完
setopt CORRECT              # スペルチェック
setopt EQUALS               # =COMMAND を COMMAND のパス名に展開する
setopt EXTENDED_GLOB        # 拡張グロブで補完(~とか^とか。例えばLESS *.TXT~MEMO.TXT ならMEMO.TXT 以外の *.TXT にマッチ)
setopt GLOBDOTS             # 明確なドットの指定なしで.から始まるファイルをマッチ
setopt INTERACTIVE_COMMENTS # コマンドラインでも # 以降をコメントと見なす
setopt LIST_PACKED          # 補完候補を詰めて表示
setopt LIST_TYPES           # 補完候補一覧でファイルの種別を識別マーク表示 (訳注:LS -F の記号)
setopt LONG_LIST_JOBS       # 内部コマンド JOBS の出力をデフォルトで JOBS -L にする
setopt MAGIC_EQUAL_SUBST    # コマンドラインの引数で --PREFIX=/USR などの = 以降でも補完できる
setopt MARK_DIRS            # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt NOAUTOREMOVESLASH    # 最後のスラッシュを自動的に削除しない
setopt NO_FLOW_CONTROL      # CTRL+S/CTRL+Q によるフロー制御を使わないようにする
setopt NUMERIC_GLOB_SORT    # ファイル名の展開で辞書順ではなく数値的にソート
# setopt PATH_DIRS            # Perform path search even on command names with slashes.
setopt PRINT_EIGHT_BIT      # 日本語ファイル名等8ビットを通す
# unsetopt FLOW_CONTROL       # Disable start/stop characters in shell editor.
# unsetopt MENU_COMPLETE      # Do not autoselect the first completion entry.

#
# Styles
#

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
