alias reload!='source ${HOME}/.zshrc'

# Super user
alias _='sudo'
alias please='sudo'

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
