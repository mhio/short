# This is this docker shortener

# shellcheck shell=sh

dockerShort(){
  #set -x
  local_docker_arg="$1"
  [ -z "$local_docker_arg" ] || shift

  case "$local_docker_arg" in
    b|bu|bui|buil)
      docker build "$@";;
    r|ru)
      docker run "$@";;
    c|co|con|cont|conta|contain|containe)
      docker container "$@";;
    i|im|ima|imag)
      if [ -z "$1" ]; then 
        docker images
      else 
        docker image "$@"
      fi
    ;;
    n|ne|net|netw|netwo)
      docker network "$@"
    ;;
    v|vo|vol|volu|volum)
      docker volume "$@"
    ;;
    psa)
      docker ps -a "$@";;
    rmin)     d_images=$(docker images | awk '/<none>/ { print $3 }')
              [ -n "$d_images" ] && echo "$d_images" | xargs docker rmi
    ;;
    rme)      d_containers=$(docker ps -a | awk '/Exited|Created/ { print $1 }')
              [ -n "$d_containers" ] && echo "$d_containers" | xargs docker rm
    ;;
    ri|rirm)
      docker run -ti --rm "$@"
    ;;
    fci)
      dockerChildImages "$@"
    ;;
    lsi)
      docker images ls "$@" |  sort
    ;;
    lsc)
      docker container ls "$@" | sort
    ;;
    h)        echo "the (d)ocker function - d (b r c i n v psa rmin rme ri fci)"
              echo " d b(uild)"
              echo " d r(un)"
              echo " d c(ommit)"
              echo " d i(mage)"
              echo " d n(network)"
              echo " d v(olume)"
              echo " d psa (ps -a)"
              echo " d rmin (rmi all <none>)"
              echo " d rme (rm all exited/created)"
              echo " d ri (run interactive and remove after)"
              echo " d fci (find child images referencing \$image_id)"
              echo " d lsi (list images)"
              echo " d lsc (list containers)"
    ;;
    *)        docker "$local_docker_arg" "$@";;
  esac
}

# Find all references to an image id (docker rmi failures)
dockerChildImages(){
  docker_child_images_image_id="$1"
  docker images --quiet --filter "since=${docker_child_images_image_id}" \
   | xargs -I {} sh -c "docker history --quiet {} | grep ${docker_child_images_image_id} && echo {}" \
   | sort -u
}
