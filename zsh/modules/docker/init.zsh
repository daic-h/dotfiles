#
# Aliases
#

alias dockm="docker-machine"
compdef dockm='docker-machine'

alias dockc="docker-compose"
compdef dockc='docker-compose'

#
# functions
#

dockb() {
    docker exec -t -i "$1" /bin/bash
}
compdef -e 'words[1]=(docker exec); service=docker; (( CURRENT+=1 )); _docker' dockb

dockm-use() {
    if [ $# != 1 ]; then
        echo $DOCKER_MACHINE_NAME
    else
        eval $(docker-machine env $1)
        export DOCKER_IP=$(docker-machine ip $1)
    fi
}
