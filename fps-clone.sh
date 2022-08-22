#!/bin/bash
set -e
github="git@github.com:sscollis"
#
# Public repos
#
repos=("lns3d" "fsc" "shoot" "stab" "npot" "os-stab" "compbl" "stag" "pse" "dyniso" "ipns")
#
# Private repos are generally limited due to licensing, collaborator approval,
# or not ready for general release
#
private=("NR-utilities" "cns2d" "hlns" "oburg" "dgm")
#
# checkout public repos for FPS
#
for r in ${repos[@]}; do
  git clone $github/$r.git
done
#
# checkout private FPS repos
#
for r in ${private[@]}; do
  git clone $github/$r.git
done
exit $?
