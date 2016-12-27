function chpwd() { ls -GF } # LSのあとcdしてくれるよ

if [[ -f ~/.dircolors && -x `which gdircolors` ]]; then
   eval `gdircolors ~/.dircolors`
fi

typeset -ga chpwd_functions
autoload -U chpwd_recent_dirs cdr
chpwd_functions+=chpwd_recent_dirs

zstyle ":chpwd:*" recent-dirs-max 500
zstyle ":chpwd:*" recent-dirs-default true
zstyle ":completion:*" recent-dirs-insert always
