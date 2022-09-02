#!/bin/bash
#===================================================================
#
# Builds all FPS codes
#
# Uses Numerical-Recipes routines if you have them and are licenced
# For codes that need BLAS, we use OpenBLAS and define
#   1) Linux:          USE_LINUXBREW_OPENBLAS=1
#   2) Apple Intel     USE_HOMEBREW_OPENBLAS=1
#   3) Apple Silicon:  USE_APPLEBREW_OPENBLAS=1
#
# The path to Numerical-Recipes is set with:  LIBNR_DIR
#
# Finally, on MacOS you may need to specify which CC compiler such
# as CC=gcc-12
#
# Author:  S. Scott Collis
# Email:   flow.phyisics.simulation@gmail.com
#
#===================================================================
set -e
OPTS=$(getopt n,r,h $*)
#echo $OPTS
eval set -- "$OPTS"
while :
do
  case "$1" in
    -h )
      echo "Usage:  fps-build.sh -n -h -- <args>"
      echo "  -n | -r : Turns Numerical-Recipes" 
      echo "  -h : This help"
      exit 2
      ;;
    -n | -r )
      FPS_USE_NR=1
      shift 1
      ;;
    -- )
      shift;
      break
      ;;
    * )
      echo "unexpected option: $1"
      ;;
  esac
done
#echo FPS_USE_NR = $FPS_USE_NR
if [[ $FPS_USE_NR -eq 1 ]] ; then
echo '============================================================='
echo '   Using Numerical Recepies (must be licenced)'
echo '     This activates builds for:  stab, shoot'
echo '     Make sure to set LIBNR_DIR as needed'
echo '============================================================='
fi
#
# Need NR for Stab, Shoot, LNS3D/mesh, LNS3D/util
#
if [[ $FPS_USR_NR -eq 1 ]] ; then
  cd NR-utilities
  \ln -fs gcc.mak Makefile
  make clean && make
  cd ../lns3d
  ./build.sh USE_NR=1 $@
else
  cd lns3d
  ./build.sh $@
fi

cd ../fsc
\ln -fs gcc.mak Makefile
make clean && make $@

cd ../npot/src
\ln -fs gcc.mak Makefile
make clean && make $@
cd ..

if [[ $FPS_USR_NR -eq 1 ]] ; then
  cd ../stab
  \ln -fs gcc.mak Makefile
  make clean && make USE_NR=1 $@

  cd ../shoot
  \ln -fs gcc.mak Makefile
  make clean && make USE_NR=1 $@

  cd ../compbl
  \ln -fs gcc.mak Makefile
  make clean && make $@
fi
#
#  
#
cd ../os-stab
\ln -fs gcc.mak Makefile
make clean && make $@

cd ../..
exit $?
