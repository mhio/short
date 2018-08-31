
# This is this kubectl shortener
function k(){
  #set -x
  local arg args
  arg=$1
  shift

  case $arg in
    c|cr*) kubectl create "$@";;
    a|ap*) kubectl apply "$@";;
    r|ru*) kubectl run "$@";;
    s|se*) kubectl set "$@";;
    g|ge*) kubectl get "$@";;
    d|de*) kubectl describe "$@";;
    e|ed*) kubectl edit "$@";;
    del)   kubectl delete "$@";;
    l|lo*) kubectl logs "$@";;
    ex|exe*) kubectl exec "$@";;
    h) echo "the (k)ubectl function - k ()"
       echo " g c(reate)"
       echo " g a(pply)"
       echo " g r(un)"
       echo " g s(et)"
       echo " g g(get)"
       echo " g d(escribe)"
       echo " g e(dit)"
       echo " g del(ete)"
       echo " g l(ogs)"
       echo " g ex(ec)"
    *) kubectl "$@";;
  esac
  #set +x
}

# MIT License Copyright (c) 2018 Matt Hoyle
