Notes for Developers
====================
## Build this code locally (using docker)
```
```

## Change Kernel configuration
```
sudo apt-get install libncurses5-dev libncursesw5-dev
cd /build/linux
cp /build/Project/profile/RT/dsl-n14u/kernel.config .config
make menuconfig
```
