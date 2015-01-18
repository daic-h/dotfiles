function fullpath {
    [[ "$#" != 1 ]] && return 1
    local filename=$1
    local dir=`pwd | tr -d "\r\n"`

    echo "${dir}/${filename}"
}
