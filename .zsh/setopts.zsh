setopt ALWAYS_LAST_PROMPT   # カーソル位置は保持したままファイル名一覧を順次その場で表示
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
setopt PRINT_EIGHT_BIT      # 日本語ファイル名等8ビットを通す
setopt nobeep               # ビープを鳴らさない
setopt complete_aliases

setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
# setopt ALWAYS_TO_END        # Move cursor to the end of a completed word.
# setopt PATH_DIRS            # Perform path search even on command names with slashes.
# unsetopt FLOW_CONTROL       # Disable start/stop characters in shell editor.
# unsetopt MENU_COMPLETE      # Do not autoselect the first completion entry.
# setopt AUTO_NAME_DIRS       # Auto add variable-stored paths to ~ list.
# setopt CDABLE_VARS          # Change directory to a path stored in a variable.
# setopt EXTENDED_GLOB        # Use extended globbing syntax.
# setopt MULTIOS              # Write to multiple descriptors.
# setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
# setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
# unsetopt CLOBBER            # Do not overwrite existing files with > and >>.
# setopt pushdminus

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
