autoload -U colors
colors

# 補完候補を一覧表示
setopt auto_list
# 補完キー連打で順に補完候補を自動で補完
setopt auto_menu
# サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt auto_resume
 # カッコの対応などを自動的に補完
setopt auto_param_keys
# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
# カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt always_last_prompt
# {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl
# スペルチェック
setopt correct
# 語の途中でもカーソル位置で補完
setopt complete_in_word
# =command を command のパス名に展開する
setopt equals
# 拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)
setopt extended_glob
# 明確なドットの指定なしで.から始まるファイルをマッチ
setopt globdots
# コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments
# 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt list_types
# 補完候補を詰めて表示
setopt list_packed
# 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs
# ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt mark_dirs
 # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst
# Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
setopt no_flow_control
# ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort
# 最後のスラッシュを自動的に削除しない
setopt noautoremoveslash
# 日本語ファイル名等8ビットを通す
setopt print_eight_bit

setopt complete_aliases

# 補完候補の色づけ
# export LSCOLORS=GxFxCxdxBxegedabagacad
# export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# dircolors
if [[ -f ~/.dircolors && -x `which gdircolors` ]]; then
  eval `gdircolors ~/.dircolors`
fi

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
