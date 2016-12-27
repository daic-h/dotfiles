#
# Aliases
#
alias fig="docker-compose"
compdef fig='docker-compose'
autoload -Uz compinit && compinit -u

alias docker-rmi-none="docker images -f dangling=true -q"
