#
# Zsh設定ファイルベースディレクトリ
#
if [[ -z "$ZSH" ]]; then
    export ZSH=$HOME/.dotfiles/zsh
fi

#
# 補完ファイルの追加
#
fpath=($ZSH/modules/zsh-completions/src $fpath)

#
# Zsh設定用ファイル
#
for lib_file in $ZSH/lib/**/*.zsh; do
    source $lib_file
done
unset lib_file

#
# Modules
#
source $ZSH/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

#
# User定義関数
#
for func_file in $ZSH/functions/*.zsh; do
    source $func_file
done
unset func_file

#
# 環境毎のローカルファイル
#
if [ -f ~/.localrc ]; then
    source ~/.localrc
fi

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit -u
