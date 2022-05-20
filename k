#!/bin/sh
set -ue
rundir=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)")

. "$rundir"/kubectl.sh

kubectlShort "$@"
