#
# Aliases
#

alias gst="git status -sb && git stash list"
alias git-root='cd `git root`'
alias git-rm-merged-branch="git branch --merged | grep -v '*' | xargs git branch -d"
