# 履歴の保存先
if [ -z $HISTFILE ]; then
    HISTFILE=$HOME/.zsh_history
fi

# メモリに展開する履歴の数
HISTSIZE=100000

# 保存する履歴の数
SAVEHIST=100000

# 複数の zsh を同時に使う時など history ファイルに上書きせず追加する
setopt append_history

# zsh の開始・終了時刻をヒストリファイルに書き込む
setopt extended_history

# ヒストリを共有
setopt share_history

# 新しいヒストリ行が入力されるとすぐに $HISTFILE に追加されるようになる。
setopt inc_append_history

# ヒストリリストの重複を排除
setopt hist_ignore_all_dups

 # 古い履歴を削除する必要がある場合、まず重複しているものから削除する。
setopt hist_expire_dups_first

# 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

# コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集
setopt hist_verify

# history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store
