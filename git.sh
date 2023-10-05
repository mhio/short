# This is this git shortener

# shellcheck shell=sh

gitShort(){
  local_git_short_arg="$1"
  [ -z "$local_git_short_arg" ] || shift

  case "$local_git_short_arg" in
  
    # Shortcuts
    a|ad) git add "$@";;
    b|br|bra|bran|branc) git branch "$@";;
    c|co|com|comm|commi) git commit "$@";;
    ca) git commit --amend "$@";;
    ch|che|chec|check|checko|checkou) git checkout "$@";;
    cl|clm) git commit -eF "$(git rev-parse --git-dir)/COMMIT_EDITMSG" "$@";;
    d|di|dif) git diff "$@";;
    f|fe|fet|fetc) git fetch "$@";;
    l|lo) git log "$@";;
    p|pu|pul) git pull "$@";;
    ps|psh|pus) git push "$@";;
    s|st|sta|stat|statu) git status "$@";;
    t|ta) git tag "$@";;

    # Addons
    ln|logname) git log --name-status "$@";;

    # Help
    h) echo "the (g)it function - g (a b c ca ch cl d f l ln p ps s t)"
       echo " g a(dd)"
       echo " g b(ranch)"
       echo " g c(ommit)"
       echo " g ca (commit --amend)"
       echo " g clm (commit with last message)"
       echo " g ch(eckout)"
       echo " g d(iff)"
       echo " g f(etch)"
       echo " g h (print g help)"
       echo " g l(og)"
       echo " g ln (log --name-status)"
       echo " g p(ull)"
       echo " g ps(h)"
       echo " g s(tatus)"
       echo " g t(ag)"
       echo
       echo "All unknown or extra paramaters are passed on to git";;
    *) git "$local_git_short_arg" "$@";; 
  esac
  #set +x
}

# MIT License Copyright (c) 2022 mhio
