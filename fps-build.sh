#!/bin/bash
set -e
#
# Need NR for Stab, Shoot, LNS3D/mesh
#
cd NR-utilities
\ln -fs gcc.mak Makefile
make clean && make

cd ../lns3d
./build.sh $@

cd ../fsc
\ln -fs gcc.mak Makefile
make clean && make $@

cd ../npot/src
\ln -fs gcc.mak Makefile
make clean && make $@
cd ..

cd ../stab
\ln -fs gcc.mak Makefile
make clean && make $@

cd ../shoot
\ln -fs gcc.mak Makefile
make clean && make $@
#
# Less needed
#
cd ../os-stab
\ln -fs gcc.mak Makefile
make clean && make $@

cd ../compbl
\ln -fs gcc.mak Makefile
make clean && make $@

cd ../..
exit $?
