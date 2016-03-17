# #
# # Variables
# #

# autoload -U colors; colors;

# PROMPT2="%{$fg[blue]%}%_> %{$reset_color%}"
# SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"
# RPROMPT="%D{%m/%d %T}"

# #
# # Promptinit
# #

# autoload -Uz promptinit && promptinit

# # Load the prompt theme.
# zstyle -a ':prezto:module:prompt' theme 'prompt_argv'
# if [[ "$TERM" == (dumb|linux|*bsd*) ]] || (( $#prompt_argv < 1 )); then
#   prompt 'off'
# else
#   prompt "$prompt_argv[@]"
# fi
# unset prompt_argv

setopt prompt_subst
autoload colors; colors;
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

local RED="%{$fg[red]%}"
local BLUE="%{$fg[blue]%}"
local BLACK="%{$fg[black]%}"
local GREEN="%{$fg[green]%}"
local YELLOW="%{$fg[yellow]%}"
local MAGENTA="%{$fg[magenta]%}"
local CYAN="%{$fg[cyan]%}"
local RANDOM_COLOR=$'%F{$[1+RANDOM%7]}'
local RESET="%{$reset_color%}"

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "A"
zstyle ':vcs_info:git:*' unstagedstr "M"
zstyle ':vcs_info:git:*' formats '%b %c%u'
zstyle ':vcs_info:git:*' actionformats '%b|%a %c%u'

function _precmd_vcs_info () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info

    if [[ -n "$vcs_info_msg_0_" ]]; then
      psvar[1]="on"
      psvar[2]="$vcs_info_msg_0_"
    fi
}
add-zsh-hook precmd _precmd_vcs_info
local VCS_PROMPT="%1(v|%1v ${RED}%2v${RESET}|)"

PROMPT="${GREEN}%n${RESET} at ${YELLOW}%m${RESET} in ${BLUE}%~${RESET} ${VCS_PROMPT}${BLACK}[%D{%m/%d %T}]${RESET}
$YELLOW✔$RESET "

# RPROMPT="%D{%m/%d %T}"
# (´・ω ・)つ$GREEN旦 $RESET"

PROMPT2=$BLUE"%_> "$RESET
SPROMPT=$RED"correct: %R -> %r [nyae]? "$RESET
