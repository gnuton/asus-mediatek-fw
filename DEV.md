Notes for Developers
====================
## Build this code locally (using docker)
```
git clone URL_TO_THIS_REPO
cd asus-media-fw
docker run -it -v $PWD:/build gnuton/asus-mediatek-toolchains-docker:latest /bin/bash
PROFILE="dsl-n16" make
```

## Change Kernel configuration
```
sudo apt-get install libncurses5-dev libncursesw5-dev
cd /build/linux
cp /build/Project/profile/RT/dsl-n14u/kernel.config .config
make menuconfig
```
