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

zstyle ':vcs_info:*' enable git svn hg
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
local VCS_PROMPT="%1(v|%1v $RED%2v$RESET|)"

# p_aa_counter=0

# p_aa_array=(
#     "(´ ・ω ・\` )"
#     "(  ´ ・ω ・)"
#     "(    ´ ・ω )"
#     "(      ´ ・)"
#     "(          )"
#     "(・\`       )"
#     "(ω ・\`     )"
#     "(・ω ・\`   )")

# function _precmd_aa () {
#     psvar[3]=$p_aa_array[`expr $p_aa_counter % ${#p_aa_array[*]} + 1`]
#     p_aa_counter=`expr $p_aa_counter + 1`
# }
# add-zsh-hook precmd _precmd_aa
# local AA_PROMPT="$RANDOM_COLOR%3v♪%f"

# PROMPT="$GREEN%n$RESET at $YELLOW%m$RESET in $BLUE%~$RESET $VCS_PROMPT
# $AA_PROMPT  "

PROMPT="$GREEN%n$RESET at $YELLOW%m$RESET in $BLUE%~$RESET $VCS_PROMPT
$BLUE(๑'ω'๑)$RESET "
# (๑ˇεˇ๑)•*¨*•.¸¸♪ "
# $ "
# (灬╹ω╹灬)"
# $YELLOW⚡$RESET "
# (´・ω ・)つ$GREEN旦 $RESET"

RPROMPT="%D{%m/%d %T}"

PROMPT2=$BLUE"%_> "$RESET
SPROMPT=$RED"correct: %R -> %r [nyae]? "$RESET
