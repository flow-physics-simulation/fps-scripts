#!/bin/bash
set -e
cd NR-utilities
make clean && make
cd ../lns3d
./build.sh $@
cd ../compbl
make clean && make $@
cd ../fsc
make clean && make $@
cd ../shoot
make clean && make $@
cd ../stab
make clean && make $@
cd ../os-stab
make clean && make $@
cd ../npot/src
make clean && make $@
cd ../..
exit $?
