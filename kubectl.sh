
# This is this kubectl shortener
function k(){
  set -x
  local arg args K_NAMESPACE_ARG
  arg="$1"
  shift
  if [ "$arg" == "ans" ]; then
    K_NAMESPACE_ARG="--all-namespaces"
    arg="$1"
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
    del)            kubectl delete    $K_NAMESPACE_ARG "$@";;
    exp*)           kubectl explain   $K_NAMESPACE_ARG "$@";;
    c|cr|cre*)      kubectl create    $K_NAMESPACE_ARG "$@";;
    co|con|conf)    kubectl config    $K_NAMESPACE_ARG "$@";;
    apiv|api-v*)    kubectl api-versions  $K_NAMESPACE_ARG "$@";;
    apir|api-r*)    kubectl api-resources $K_NAMESPACE_ARG "$@";;
    a|ap*)          kubectl apply     $K_NAMESPACE_ARG "$@";;
    r|ru)           kubectl run       $K_NAMESPACE_ARG "$@";;
    s|se)           kubectl set       $K_NAMESPACE_ARG "$@";;
    g|ge)           kubectl get       $K_NAMESPACE_ARG "$@";;
    d|de|des|desc)  kubectl describe  $K_NAMESPACE_ARG "$@";;
    e|ed|edi)       kubectl edit      $K_NAMESPACE_ARG "$@";;
    l|lo|log)       kubectl logs      $K_NAMESPACE_ARG "$@";;
    ex|exe)         kubectl exec      $K_NAMESPACE_ARG "$@";;
    h|help) echo "the (k)ubectl function - k ()"
       echo " k a(pply)"
       echo " k c(reate)"
       echo " k e(dit)"
       echo " k g(get)"
       echo " k d(escribe)"
       echo " k s(et)"
       echo " k del(ete)"
       echo " k l(ogs)"
       echo " k ex(ec)"
       echo " k r(un)"
       echo " k api-v(ersion)"
       echo " k api-r(esources)"
       echo " k co(nfig)"
       ;;
    *) kubectl $K_NAMESPACE_ARG "$arg" "$@";;
  esac
  set +x
}

set_kubeconfig_namespace(){
  local namespace="$1"
  context=$(kubectl config current-context)
}

# MIT License Copyright (c) 2019 Matt Hoyle
