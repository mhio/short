
# This is this kubectl shortener
function k(){
  set -x
  local arg args
  arg="$1"
  shift
  if [ "$arg" == "-n" -o "$arg" == "--namespace" ]; then
    K_NS="$1"
    shift
  fi
  if [ -n "$K_NS" ]; then
    if [ "$K_NS" == "all" ]; then
      K_NAMESPACE_ARG="--all-namespaces"
    else
      K_NAMESPACE_ARG="--namespace \"$K_NS\""
    fi
  fi
  case $arg in
    #cns)   set_kubeconfig_namespace;;
    c|cr*) kubectl create   $K_NAMESPACE_ARG "$@";;
    a|ap*) kubectl apply    $K_NAMESPACE_ARG "$@";;
    r|ru*) kubectl run      $K_NAMESPACE_ARG "$@";;
    s|se*) kubectl set      $K_NAMESPACE_ARG "$@";;
    g|ge*) kubectl get      $K_NAMESPACE_ARG "$@";;
    d|de*) kubectl describe $K_NAMESPACE_ARG "$@";;
    e|ed*) kubectl edit     $K_NAMESPACE_ARG "$@";;
    del)   kubectl delete   $K_NAMESPACE_ARG "$@";;
    l|lo*) kubectl logs     $K_NAMESPACE_ARG "$@";;
    ex|exe*) kubectl exec   $K_NAMESPACE_ARG "$@";;
    h) echo "the (k)ubectl function - k ()"
       echo " k c(reate)"
       echo " k a(pply)"
       echo " k r(un)"
       echo " k s(et)"
       echo " k g(get)"
       echo " k d(escribe)"
       echo " k e(dit)"
       echo " k del(ete)"
       echo " k l(ogs)"
       echo " k ex(ec)";;
    *) kubectl $K_NAMESPACE_ARG "$@";;
  esac
  set +x
}

set_kubeconfig_namespace(){
  local namespace="$1"
  context=$(kubectl config current-context)
}

# MIT License Copyright (c) 2018 Matt Hoyle
