source $ZDOTDIR/zplug.zsh
source $ZDOTDIR/bindkeys.zsh
source $ZDOTDIR/setopts.zsh
source $ZDOTDIR/completions.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/directory.zsh
source $ZDOTDIR/prompt.zsh

# source $ZDOTDIR/modules/direnv/init.zsh
source $ZDOTDIR/modules/docker/init.zsh
source $ZDOTDIR/modules/emacs/init.zsh
source $ZDOTDIR/modules/fzf/init.zsh
source $ZDOTDIR/modules/ghq/init.zsh
source $ZDOTDIR/modules/git/init.zsh
source $ZDOTDIR/modules/homebrew/init.zsh
source $ZDOTDIR/modules/ruby/init.zsh
source $ZDOTDIR/modules/go/init.zsh

[[ -f ~/.local.zsh ]] && source ~/.local.zsh
