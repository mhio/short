#!/bin/sh
set -ue
rundir=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)")

# shellcheck source=git.sh
. "${rundir}"/git.sh

gitShort "$@"
