#
# Aliases
#

alias dockm="docker-machine"
alias dockc="docker-compose"

#
# functions
#

docker-bash() {
    docker exec -t -i "$1" /bin/bash
}

dm-use() {
    if [ $# != 1 ]; then
        echo $DOCKER_MACHINE_NAME
    else
        eval $(docker-machine env $1)
        export DOCKER_IP=$(docker-machine ip $1)
    fi
}
