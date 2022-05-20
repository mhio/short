# This is this git shortener

# shellcheck shell=sh

gitShort(){
  local_git_short_arg="$1"
  [ -z "$local_git_short_arg" ] || shift

  case "$local_git_short_arg" in
    a|ad) git add "$@";;
    b|br|bra|bran|branc) git branch "$@";;
    c|co|com|comm|commi) git commit "$@";;
    ch|che|chec|check|checko|checkou) git checkout "$@";;
    d|di|dif) git diff "$@";;
    l|lo) git log "$@";;
    p|pu|pul) git pull "$@";;
    ps|psh|pus) git push "$@";;
    s|st|sta|stat|statu) git status "$@";;
    t|ta) git tag "$@";;
    h) echo "the (g)it function - g (a b c ch d l p ps s t)"
       echo " g a(dd)"
       echo " g b(ranch)"
       echo " g c(ommit)"
       echo " g ch(eckout)"
       echo " g d(iff)"
       echo " g l(og)"
       echo " g p(ull)"
       echo " g ps(h)"
       echo " g s(tatus)"
       echo " g t(ag)"
       echo
       echo "All unkown or extra paramaters are passed on to git";;
    *) git "$local_git_short_arg" "$@";; 
  esac
  #set +x
}

# MIT License Copyright (c) 2022 mhio
