
# This is this git shortener
function g(){
  #set -x
  local arg
  arg=$1
  [ -z "$arg" ] || shift

  case $arg in
    a|ad|add) git add "$@";;
    b|br|bra*) git branch "$@";;
    c|co|com*) git commit "$@";;
    ch|che*) git checkout "$@";;
    clp) gitClonePublic "$@";;
    d|di|dif|diff) git diff "$@";;
    l|lo|log) git log "$@";;
    p|pu|pul|pull) git pull "$@";;
    ps|psh|pus|push) git push "$@";;
    s|st|sta|stat*) git status "$@";;
    h) echo "the (g)it function - g (a b c d l p ps s)"
       echo " g a(dd)"
       echo " g b(ranch)"
       echo " g c(ommit)"
       echo " g ch(eckout)"
       echo " g clp (clone public with full path)"
       echo " g d(iff)"
       echo " g l(og)"
       echo " g p(ull)"
       echo " g ps(h)"
       echo " g s(tatus)"
       echo
       echo "All unkown or extra paramaters are passed on to git";;
    *) git "$arg" "$@";; 
  esac
  #set +x
}

# MIT License Copyright (c) 2018 Matt Hoyle
