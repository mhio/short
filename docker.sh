
# This is this docker shortener
function d(){
  #set -x
  local arg args
  arg=$1
  shift

  case $arg in
    b|bu*)    docker build "$@";;
    r|ru*)    docker run "$@";;
    c|co*)    docker container "$@";;
    i|im*)    docker image "$@";;
    n|ne*)    docker network "$@";;
    v|vo*)    docker volume "$@";;
    psa)      docker ps -a "$@";;
    rmin)     d_images=$(docker images | awk '/<none>/ { print $3 }')
              [ -n "$d_images" ] && docker rmi $d_images
    ;;
    rme)      d_containers=$(docker ps -a | awk '/Exited|Created/ { print $1 }')
              [ -n "$d_containers" ] && docker rm $d_containers
    ;;
    h) echo "the (d)ocker function - d (b r c i n v)"
       echo " d b(uild)"
       echo " d r(un)"
}

# MIT License Copyright (c) 2018 Matt Hoyle
