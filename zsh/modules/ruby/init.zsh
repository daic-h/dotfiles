if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
    # Unset AUTO_NAME_DIRS since auto adding variable-stored paths to ~ list
    # conflicts with RVM.
    unsetopt AUTO_NAME_DIRS

    # Source RVM.
    source "$HOME/.rvm/scripts/rvm"

    # Load manually installed rbenv into the shell session.
elif [[ -s "$HOME/.rbenv/bin/rbenv" ]]; then
    path=("$HOME/.rbenv/bin" $path)
    eval "$(rbenv init - --no-rehash zsh)"

    # Load package manager installed rbenv into the shell session.
elif (( $+commands[rbenv] )); then
    eval "$(rbenv init - --no-rehash zsh)"
fi

# Return if requirements are not found.
if (( ! $+commands[ruby] && ! ( $+commands[rvm] || $+commands[rbenv] ) )); then
  return 1
fi
