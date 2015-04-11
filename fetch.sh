#!/usr/bin/bash
set -x -e
cd /home/core
KERN=$(uname -r)
RELEASE=zfs-${KERN}.tar.gz
curl -f -o ${RELEASE} https://raw.githubusercontent.com/ClusterHQ/zfs-binaries/master/coreos/${RELEASE}
if [ -d gentoo ]; then
    mv gentoo gentoo.bak
fi
tar xf ${RELEASE}
sudo depmod -b ~/gentoo
sudo modprobe -d ~/gentoo zfs
