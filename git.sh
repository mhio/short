
# This is this git shortener
function g(){
  #set -x
  local arg args
  arg=$1
  shift

  case $arg in
    a|ad*) git add "$@";;
    b|br*) git branch "$@";;
    c|co*) git commit "$@";;
    d|di*) git diff "$@";;
    l|lo*) git log "$@";;
    s|st*) git status "$@";;
    h) echo "the (g)it function - g (a b c d l s)"
       echo " g a(dd)"
       echo " g b(ranch)"
       echo " g c(ommit)"
       echo " g d(iff)"
       echo " g l(og)"
       echo " g s(tatus)";;
    *) git "$@";; 
  esac
  #set +x
}
