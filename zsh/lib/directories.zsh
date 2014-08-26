setopt auto_cd
setopt auto_pushd
# setopt auto_name_dirs
setopt pushd_ignore_dups
setopt pushdminus

function chpwd() { ls -GF } # LSのあとcdしてくれるよ
