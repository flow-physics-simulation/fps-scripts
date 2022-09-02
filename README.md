# FPS scripts

Scripts to help manage the FPS code suite

Script       |  Description
-------------|-------------------
fps-clone.sh |  Clone all 
fps-build.sh |  Build all FPS codes
fps-git.sh   |  Execute a git command in multiple repos

## How to use

To clone all FPS codes from GitHub and build all:
```bash
cd $FPSROOT
$FPSSCRIPTS/fps-clone.sh 
$FPSSCRIPTS/fps-build.sh CC=gcc-12
```
Where in this case, we have set the CC compiler to be `gcc-12` as needed
on recent Mac profiles when using HomeBrew GCC.

`$FPSROOT` is where you want the FPS codes located and `$FPSSCRIPTS` is
where you have cloned the `fps-scripts` repo using something like:
```bash
git clone git@github.com:flow-physics-simulation/fps-scripts.git
export FPSSCRIPTS=`pwd`/fps-scripts
```
If running on AppleSilicon, you would use:
```bash
$FPSSCRIPTS/fps-build.sh USE_APPLEBREW_OPENBLAS=1 CC=gcc-12 \
USE_NR=1 LIBNR_DIR=$HOME/fps/NR-utilities
```
where I have set the path for Numerical Recepies (optional) utilities if you
happen to have a valid licence to use them.

```bash
./fps-scripts/fps-build.sh -n -- USE_APPLEBREW_OPENBLAS=1 CC=gcc-12 LIBNR_DIR=$HOME/fps/NR-utilities
```

If on Linux, HomeBrew install yet again in another location, so you would use
```bash
$FPSSCRIPTS/fps-build.sh USE_LINUXBREW_OPENBLAS=1 \
LIBNR_DIR=$HOME/fps/NR-utilities
```

S. Scott Collis\
flow.physics.simulation@gmail.com
