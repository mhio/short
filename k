#!/bin/bash

rundir=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)")
canonical="$rundir/$(basename -- "$0")"

source $rundir/kubectl.sh

k "$@"
