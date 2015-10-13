#
# Variables
#

HISTFILE=$HOME/.zsh_history # 履歴の保存先
HISTSIZE=100000             # メモリに展開する履歴の数
SAVEHIST=100000             # 保存する履歴の数

#
# Options
#

setopt APPEND_HISTORY         # 複数の ZSH を同時に使う時など HISTORY ファイルに上書きせず追加する
setopt BANG_HIST              # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY       # ZSH の開始・終了時刻をヒストリファイルに書き込む
setopt HIST_EXPIRE_DUPS_FIRST # 古い履歴を削除する必要がある場合、まず重複しているものから削除する。
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS   # ヒストリリストの重複を排除
setopt HIST_IGNORE_DUPS       # 直前と同じコマンドをヒストリに追加しない
setopt HIST_IGNORE_SPACE      # コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt HIST_NO_STORE          # history (fc -l) コマンドをヒストリリストから取り除く。
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
setopt HIST_VERIFY            # Do not execute immediately upon history expansion.
setopt HIST_VERIFY            # ヒストリを呼び出してから実行する間に一旦編集
setopt INC_APPEND_HISTORY     # 新しいヒストリ行が入力されるとすぐに $HISTFILE に追加されるようになる。
setopt SHARE_HISTORY          # ヒストリを共有

#
# Aliases
#

# Lists the ten most used commands.
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

#
# Bindkey
#

bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
