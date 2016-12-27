alias reload!='source ${HOME}/.zshrc'
# alias history='fc -l 1'

alias del="rm -rf"
alias cp="cp -irf"
alias mv="mv -i"
alias ..='cd ..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'

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

alias webrick="ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 8000).start'"

# osx
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias ldd="echo ldd is not on OSX. use otool -L."
alias strace="echo strace is not on OSX. use dtruss"
