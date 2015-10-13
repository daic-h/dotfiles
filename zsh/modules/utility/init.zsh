#
# Aliases
#

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

# ls
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

#if [[ -f ~/.dircolors && -x `which gdircolors` ]]; then
#    eval `gdircolors ~/.dircolors`
#else
#    # export LSCOLORS=GxFxCxdxBxegedabagacad
#    export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
#fi

# osx
alias updatedb='sudo /usr/libexec/locate.updatedb'

# ruby
alias webrick="ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => \"./\", :Port => 8000).start'"
