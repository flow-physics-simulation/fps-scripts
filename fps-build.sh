#!/bin/bash
set -e
#
# Need NR for Stab, Shoot, LNS3D/mesh
#
cd NR-utilities
make clean && make

cd ../lns3d
./build.sh $@

cd ../fsc
make clean && make $@

cd ../npot/src
make clean && make $@

cd ../stab
make clean && make $@

cd ../shoot
make clean && make $@
#
# Less needed
#
cd ../os-stab
make clean && make $@

cd ../compbl
make clean && make $@

cd ../..
exit $?
