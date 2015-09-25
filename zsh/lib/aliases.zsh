alias reload!='source ${HOME}/.zshrc'

# Show history
# alias history='fc -l 1'

# List direcory contents
if [[ -x `which gls` ]]; then
    alias ls='gls --color=auto'
else
    alias ls='ls -GF'
fi

alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -la'
alias la='ls -lA'
alias sl=ls # often screw this up
alias del="rm -rf"
alias cp="cp -irf"
alias mv="mv -i"
alias ..='cd ..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'

alias md='mkdir -p'
alias rd='rmdir'

alias updatedb='sudo /usr/libexec/locate.updatedb'

# git
alias gst="git status -sb && git stash list"
alias git-root='cd `git root`'
alias git-rm-merged-branch="git branch --merged | grep -v '*' | xargs git branch -d"

# emacs
#alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
#alias emacsclient='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
alias emacs.tmpdir='${TMPDIR}emacs$(id -u)'
alias emacs.rmsock='rm ${TMPDIR}emacs$(id -u)/server'

# ruby
alias webrick="ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 8000).start'"
