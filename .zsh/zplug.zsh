source ~/.zplug/init.zsh

zplug "zplug/zplug"

zplug "zsh-users/zsh-completions"

zplug 'Valodim/zsh-curl-completion'

zplug "zsh-users/zsh-history-substring-search"

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "plugins/docker", \
      from:oh-my-zsh

zplug "plugins/docker-compose", \
      from:oh-my-zsh

zplug "plugins/kubectl", \
      from:oh-my-zsh

zplug "mrowa44/emojify", \
      as:command

zplug "stedolan/jq", \
    as:command, \
    from:gh-r, \
    frozen:1

zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    rename-to:"fzf", \
    frozen:1

zplug "monochromegane/the_platinum_searcher", \
    as:command, \
    from:gh-r, \
    rename-to:"pt", \
    frozen:1

zplug "peco/peco", \
    as:command, \
    from:gh-r, \
    frozen:1

zplug "motemen/ghq", \
    as:command, \
    from:gh-r, \
    rename-to:ghq

zplug "tcnksm/ghr", \
    as:command, \
    from:gh-r

zplug "philovivero/distribution", \
    as:command, \
    use:distribution, \
    if:'(( $+commands[perl] ))'


# zplug 'S1cK94/minimal', \
#       as:theme

# zplug update --self
zplug check || zplug install
zplug load
